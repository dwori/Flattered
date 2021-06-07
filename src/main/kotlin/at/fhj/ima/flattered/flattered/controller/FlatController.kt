package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import at.fhj.ima.flattered.flattered.service.FlatService
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
class FlatController(val flatRepository: flatRepository, val groceryItemRepository: groceryItemRepository,
                     val userService: UserService, val flatService: FlatService
) {

    @RequestMapping("/editFlat", method = [RequestMethod.GET])
    fun editFlat(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val flat = flatRepository.findById(id).get()
            model["flat"] = flat
        } else {
            val newFlat = flat()
            model["flat"] = newFlat
        }
        return "editFlat"
    }
    @Secured("ROLE_USER")
    @RequestMapping("/changeFlat", method = [RequestMethod.POST])
    fun changeFlat(@ModelAttribute flat: flat): String {
        val currentUser = userService.getCurrentUser()
        flat.admins.add(currentUser) //adds the current user automatically to the new flat as admin and as user
        flat.users.add(currentUser)
        flatService.saveFlat(flat)

        //go back to the entire list
        return "redirect:/listFlat"
    }

    @RequestMapping("/listFlat", method = [RequestMethod.GET])
    fun listFlat(model: Model): String{
        model.set("flatList", flatRepository.findAll())
        return "listFlat"
    }
    @Transactional
    @Secured("ROLE_USER")
    @RequestMapping("/deleteFlat", method = [RequestMethod.GET])
    fun deleteFlat(model: Model, @RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        val flat = flatRepository.findById(id).get()

        for (x in groceryItemRepository.findByFlat(id)){
            groceryItemRepository.delete(x)

        }

        flatRepository.delete(flat)

        val message = "Flat: ${flat.name} has been deleted!"
        redirectAttributes.addFlashAttribute("errorMessage",message)

        return "redirect:/listFlat"
    }
}