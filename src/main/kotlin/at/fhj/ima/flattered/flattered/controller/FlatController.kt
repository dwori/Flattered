package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import at.fhj.ima.flattered.flattered.service.FlatService
import at.fhj.ima.flattered.flattered.service.GroceryService
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.transaction.annotation.Transactional
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes


@Controller
class FlatController(val flatService: FlatService,
                     val groceryService: GroceryService,
                     val userService: UserService,
) {

    @RequestMapping("/editFlat", method = [RequestMethod.GET])
    fun editFlat(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val flat = flatService.getFlat(id)
            model["flat"] = flat
        } else {
            val newFlat = flatService.createFlat()
            model["flat"] = newFlat
        }
        return "/editFlat"
    }
    @Secured("ROLE_USER")
    @RequestMapping("/changeFlat", method = [RequestMethod.POST])
    fun changeFlat(@ModelAttribute flat: flat): String {
        val currentUser = userService.getCurrentUser()

        if (flat.admins.contains(currentUser)){
            flatService.saveFlat(flat)
        }else{
            flat.admins.add(currentUser) //adds the current user automatically to the new flat as admin and as user
            flat.users.add(currentUser)
            flatService.saveFlat(flat)
        }

        //go back to the entire list
        return "redirect:/listFlat"
    }

    @RequestMapping("/listFlat", method = [RequestMethod.GET])
    fun listFlat(model: Model): String{
        model.set("flatList", flatService.findAllFlats())
        model.set("currentUser", userService.getCurrentUser())
        return "listFlat"
    }
    @Transactional
    @Secured("ROLE_USER")
    @RequestMapping("/deleteFlat", method = [RequestMethod.GET])
    fun deleteFlat(model: Model, @RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        val flat = flatService.getFlat(id)
        val currentUser = userService.getCurrentUser()

        //Allows delete only if user is member of the flat_admins
        if (flat.admins.contains(currentUser)){
            for (x in groceryService.findByFlat(id)){
                groceryService.deleteGroceryItem(x)
            }

            flatService.deleteFlat(flat)

            //Message displayed for user
            val message = "Flat: ${flat.name} has been deleted!"
            redirectAttributes.addFlashAttribute("errorMessage",message)
        }else{
            //Throws an error if no permission is granted
            throw Exception("No permission for User: ${currentUser.username}")
        }
        return "redirect:/listFlat"
    }
}