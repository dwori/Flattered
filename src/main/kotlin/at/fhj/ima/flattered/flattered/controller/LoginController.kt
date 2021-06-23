package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.User
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
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
    fun changeUser(@ModelAttribute @Valid user: User,
                   bindingResult: BindingResult,
                   redirectAttributes: RedirectAttributes,
                   @RequestParam(required = false) passwordAgain: String? = null): String {

        val passwd = user.password
        if (bindingResult.hasErrors()){
            return "editUser"
        }
        try {
            if (user.password != passwordAgain){
                val message = "Please confirm your password!"
                redirectAttributes.addFlashAttribute("errorMessage", message)
                return "redirect:/editUser"
            } else {
                user.password = BCryptPasswordEncoder().encode(user.password)
                userService.saveUser(user)
                val message = "Account successfully created"
                redirectAttributes.addFlashAttribute("message", message)
            }
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [username_UK]")) {
                bindingResult.rejectValue("username","username.alreadyInUse", "Username already in use.");
                user.password = passwd
                return "editUser"
            } else {
                throw dive
            }
        }
        return "redirect:/login"
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
                   bindingResult: BindingResult,
                   redirectAttributes: RedirectAttributes,
                   @RequestParam(required = false) newPassword: String,
                   @RequestParam(required = false) newPasswordAgain: String): String{

        if (bindingResult.hasErrors()){
            return "editProfile"
        }
        try {
            if (newPassword != "" || newPasswordAgain != ""){
                if (newPassword != newPasswordAgain){
                    val message = "Please confirm your password!"
                    redirectAttributes.addFlashAttribute("errorMessage", message)
                    return "redirect:/editProfile?id=${user.id}"
                } else {
                    user.password = BCryptPasswordEncoder().encode(newPassword)
                    userService.saveUser(user)
                    val message = "Success, please login with your new credentials"
                    redirectAttributes.addFlashAttribute("message", message)
                }
            } else {
                val message = "Success, please login"
                redirectAttributes.addFlashAttribute("message", message)
                userService.saveUser(user)
            }
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [username_UK]")) {
                bindingResult.rejectValue("username","username.alreadyInUse", "Username already in use.");
                return "editProfile"
            } else {
                throw dive
            }
        }
        return "redirect:/login"
    }
}