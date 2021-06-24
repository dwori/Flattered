package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.data.FlatFormData
import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.service.FlatService
import at.fhj.ima.flattered.flattered.service.GroceryService
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.transaction.annotation.Transactional
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes
import javax.validation.Valid


@Controller
class FlatController(val flatService: FlatService,
                     val groceryService: GroceryService,
                     val userService: UserService,
) {

    @RequestMapping("/editFlat", method = [RequestMethod.GET])
    fun editFlat(model: Model, @RequestParam(required = false) id: Int?): String {
        /*
         * Checks if the id of the incoming flat is null.
         * If this is true a new flat will be created, if not than the flat with the responding id is loaded.
         */
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
    fun changeFlat(@ModelAttribute @Valid flat: flat, bindingResult: BindingResult, model: Model): String {
        /*
         * Saves changes to the repository. Tries to save changes, switch the users current flat to the changed one.
         * It adds the currentUser to the flat's users and assigns him the admin role. After that the flat list is displayed.
         */
        if (bindingResult.hasErrors()){
            return "editFlat"
        }
        try {
            val currentUser = userService.getCurrentUser()
            flat.users.add(currentUser)
            flat.admins.add(currentUser)

            flatService.saveFlat(flat)
            flatService.switchCurrentFlat(flat.id)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [name_UK]")) {
                bindingResult.rejectValue("name","name.alreadyInUse", "Name already in use.");
                return "editFlat"
            } else {
                throw dive
            }
        }
        return "redirect:/listFlat"
    }

    @RequestMapping("/listFlat", method = [RequestMethod.GET])
    fun listFlat(model: Model): String{
        /*
         * Fills the flatList model with all flats, creates a model for the current user, and a model for the check if
         * the current user is part of the admins for this flat.
         */
        val flats = flatService.findAllFlats()
        model["flatList"] = flats
        model["currentUser"] = userService.getCurrentUser()
        model["currentUserisAdmin"] = userService.isFlatAdmins(flats)
        return "listFlat"
    }
    @Transactional
    @Secured("ROLE_USER")
    @RequestMapping("/deleteFlat", method = [RequestMethod.GET])
    fun deleteFlat(model: Model, @RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        /*
         * Acquires the flat by it's id and deletes it from the repository and database.
         * Additionally all groceryItems from the flats grocery list get deleted too.
         * If the deleted flat was the users current flat, the users current flat gets switched to null, in order to
         * avoid any errors.
         */
        val flat = flatService.getFlat(id)
        val currentUser = userService.getCurrentUser()

        //Allows delete only if user is member of the flat_admins
        if (flat.admins.contains(currentUser)){
            for (x in groceryService.findByFlat(id)){
                groceryService.deleteGroceryItem(x)
            }
            if (currentUser.currentUserflat == flat){
                flatService.switchCurrentFlat(null)
            }
            flatService.deleteFlat(flat)

            //Message displayed for user
            val message = "Flat: ${flat.name} has been deleted!"
            redirectAttributes.addFlashAttribute("errorMessage",message)
        }else{
            //Displays the error page if no permission is granted. Should not be possible anyways.
            return "/error"
        }
        return "redirect:/listFlat"
    }
    @RequestMapping("/joinFlat", method = [RequestMethod.GET])
    fun joinFlat(model: Model): String{
        /*
         * Is used to lead the user to the joinFlat page
         */
        model["flat"] = flatService.createFlat()
        return "joinFlat"
    }

    @RequestMapping("/joinAFlat", method = [RequestMethod.POST])
    fun joinAFlat(@RequestParam token: String, redirectAttributes: RedirectAttributes): String{
        /*
         * Finds a flat by its unique secret token and the current user. If a flat is found with the token, the user gets
         * added to the flats users and a success message is displayed.
         * If no flat is returned for some reasons, an error message is displayed nad nothing else happens.
         * After everything the flat list is displayed.
         */
        val flat = flatService.findFlatByToken(token)
        val currentUser = userService.getCurrentUser()
        var message: String

        if (flat != null){
            flat.users.add(currentUser)
            flatService.saveFlat(flat)
            message = "${currentUser.username} was succesfully added to Flat: ${flat.name}"
            redirectAttributes.addFlashAttribute("message",message)
        }else{
            message = "${currentUser.username} could not be added to Flat: ${flat.name}"
            redirectAttributes.addFlashAttribute("message",message)
        }

        return "redirect:/listFlat"
    }
    @RequestMapping("/kick", method = [RequestMethod.POST])
    fun kick(flatId: Int, userId: Int): String{
        /*
         * Takes a user and a flat by their id and removes the user from the flats users.
         * To avoid errors the users current flat is always to null.
         */
        val flat = flatService.getFlat(flatId)
        flat.users = flat.users.filterTo(mutableSetOf()){ user -> user.id != userId}
        flatService.saveFlat(flat)
        flatService.switchFlat(null,userId)
        return "redirect:/listFlat"
    }

}