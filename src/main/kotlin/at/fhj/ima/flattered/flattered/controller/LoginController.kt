package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.entity.user
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class LoginController(val userService: UserService) {

    @RequestMapping("/login", method = [RequestMethod.GET])
    fun login(): String{
        return "login"
    }

    @RequestMapping("/editUser", method = [RequestMethod.GET])
    fun editUser(model: Model, @RequestParam(required = false) id: Int?): String{
        if (id != null) {
            val user = userService.getUserById(id)
            model["user"] = user
        } else {
            val user = userService.createUser()
            model["user"] = user
        }
        return "editUser"
    }

    @RequestMapping("/changeUser", method = [RequestMethod.POST])
    fun changeUser(@ModelAttribute user: user): String {
        user.password = BCryptPasswordEncoder().encode(user.password)
        userService.saveUser(user)
        return "redirect:/"
    }
}