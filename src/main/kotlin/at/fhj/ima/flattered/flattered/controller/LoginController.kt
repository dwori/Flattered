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
import org.springframework.web.servlet.mvc.support.RedirectAttributes

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
            model["user"] = user!!
        } else {
            val user = userService.createUser()
            model["user"] = user
        }
        return "editUser"
    }

    @RequestMapping("/changeUser", method = [RequestMethod.POST])
    fun changeUser(@ModelAttribute user: user, @RequestParam(required = false) passwordAgain: String? = null): String {
        if (user.password != passwordAgain){
            //TODO ERROR MESSAGE
            return "editUser"
        } else{
            user.password = BCryptPasswordEncoder().encode(user.password)
            userService.saveUser(user)
            return "redirect:/"
        }
    }

    @RequestMapping("/editProfile", method = [RequestMethod.GET])
    fun editProfile(model: Model, @RequestParam(required = false) id: Int): String{
        val user = userService.getUserById(id)
        model["user"] = user!!
        return "editProfile"
    }

    @RequestMapping("/updateUser", method = [RequestMethod.POST])
    fun updateUser(@ModelAttribute user: user,
                   //redirectAttributes: RedirectAttributes,
                   @RequestParam(required = false) newPassword: String? = null,
                   @RequestParam(required = false) newPasswordAgain: String? = null): String{

        if (newPassword != null || newPasswordAgain != null){
            if (newPassword != newPasswordAgain){
                //TODO ERROR MESSAGE
                //redirectAttributes.addFlashAttribute("errorMessage","If you want to set a new Password please confirm it.")
                //return "redirect:/editProfile"
                return "editProfile"
            } else {
                user.password = BCryptPasswordEncoder().encode(newPassword)
                userService.saveUser(user)
            }
        } else if (user.username != user.id?.let { userService.getUserById(it) }){
            userService.saveUser(user)
        }

        return "login"
    }
}