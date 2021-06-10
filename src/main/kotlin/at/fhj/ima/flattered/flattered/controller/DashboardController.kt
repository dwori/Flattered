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


@Controller
class DashboardController(val flatService: FlatService,
                          val groceryService: GroceryService,
                          val userService: UserService,
) {
    @RequestMapping("/dashboard",method = [RequestMethod.GET])
    fun dashboard(model: Model): String{
        val actualUser = userService.getCurrentUser()
        model["currentUser"] = actualUser
        model.set("groceryList", groceryService.findAll())

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

    @RequestMapping("/switchCurrentFlat",method = [RequestMethod.GET])
    fun switchCurrentFlat(@RequestParam id: Int): String{
        val currentUser = userService.getCurrentUser()
        currentUser.currentUserflat = flatService.getFlat(id)
        userService.saveUser(currentUser)

        return "dashboard"
    }

}