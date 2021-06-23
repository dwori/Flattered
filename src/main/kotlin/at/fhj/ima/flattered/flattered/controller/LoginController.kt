package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.User
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
            model["user"] = user
        } else {
            val user = userService.createUser()
            model["user"] = user
        }
        return "editUser"
    }

    @RequestMapping("/changeUser", method = [RequestMethod.POST])
    fun changeUser(@ModelAttribute user: User, redirectAttributes: RedirectAttributes, @RequestParam(required = false) passwordAgain: String? = null): String {
        if (user.password != passwordAgain){
            val message = "Please confirm your password!"
            redirectAttributes.addFlashAttribute("errorMessage", message)
            return "redirect:/editUser"
        } else{
            user.password = BCryptPasswordEncoder().encode(user.password)
            userService.saveUser(user)
            val message = "Account successfully created"
            redirectAttributes.addFlashAttribute("message", message)
            return "redirect:/login"
        }
    }

    @RequestMapping("/editProfile", method = [RequestMethod.GET])
    fun editProfile(model: Model, @RequestParam(required = false) id: Int): String{
        val user = userService.findUserById(id)

        if (user == userService.getCurrentUser()){
            model["user"] = user
            return "editProfile"
        }
        return "/error"
    }

    @RequestMapping("/updateUser", method = [RequestMethod.POST])
    fun updateUser(@ModelAttribute user: User,
                   redirectAttributes: RedirectAttributes,
                   @RequestParam(required = false) newPassword: String,
                   @RequestParam(required = false) newPasswordAgain: String): String{

        if (newPassword != "" || newPasswordAgain != ""){
            if (newPassword != newPasswordAgain){
                val message = "Please confirm your password!"
                redirectAttributes.addFlashAttribute("errorMessage", message)
                return "redirect:/editProfile?id=${user.id}"
            } else {
                val message = "Success, please login with your new credentials"
                redirectAttributes.addFlashAttribute("message", message)
                user.password = BCryptPasswordEncoder().encode(newPassword)
                userService.saveUser(user)
            }
        } else {
            val message = "Success, please login"
            redirectAttributes.addFlashAttribute("message", message)
            userService.saveUser(user)
        }
        return "redirect:/login"

    }
}