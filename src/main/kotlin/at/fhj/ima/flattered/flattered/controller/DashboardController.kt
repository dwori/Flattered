package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.service.FlatService
import at.fhj.ima.flattered.flattered.service.GroceryService
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes


@Controller
class DashboardController(val flatService: FlatService,
                          val groceryService: GroceryService,
                          val userService: UserService,
) {
    @RequestMapping("/dashboard",method = [RequestMethod.GET])
    fun dashboard(model: Model): String{
        /*
         * The current user is saved in a model, the groceryList, the users current flat - name and members are modeled too.
         * The other flats of the current user are saved in a model as well.
         */
        val actualUser = userService.getCurrentUser()
        model["currentUser"] = actualUser
        model["groceryList"] = groceryService.findAll()

        val flatMember = actualUser.currentUserflat?.id?.let { flatService.getFlatUsers(it) }
        if (flatMember != null) {
            model["member"] = flatMember
        }

        val name = actualUser.currentUserflat?.name
        if (name != null) {
            model["flatName"] = name
        }

        val flats = userService.getUserFlats(actualUser)
        if (flats != null) {
            model["userFlats"] = flats
        }

        return "dashboard"
    }

    @RequestMapping("/", method = [RequestMethod.GET])
    fun start(): String{
        /*
         * Leads the user to the dashboard page after login.
         */
        return "redirect:/dashboard"
    }

    @RequestMapping("/switchCurrentFlat",method = [RequestMethod.GET])
    fun switchCurrentFlat(@RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        /*
         * Takes a flat by it's id and changes the current users current flat to this flat.
         * Afterwards a message about the actions success is displayed and the dashboard page is displayed.
         */
        val currentUser = userService.getCurrentUser()
        currentUser.currentUserflat = flatService.getFlat(id)
        userService.saveUser(currentUser)

        val message = "Switched to Flat: ${flatService.getFlat(id).name}!"
        redirectAttributes.addFlashAttribute("message",message)

        return "redirect:/dashboard"
    }

}