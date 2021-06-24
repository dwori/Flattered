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
        /*
        * If there is no id parameter provided, a new user model is created.
        * If there is an id parameter provided, the corresponding user is found in the repository and returned as a model.
        * */
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

        /*
        * Username and password inputs are checked.
        * If every input is provided successfully, we create a new user in the Repository.
        * If an input is missing or not provided correctly, we send an corresponding error message and do not create a new User.
        * */
        val passwd = user.password
        if (bindingResult.hasErrors()){
            return "editUser"
        }
        try {
            if (user.username == "" || user.password == ""){
                val message = "Username and Password can't be empty!"
                redirectAttributes.addFlashAttribute("errorMessage", message)
                return "redirect:/editUser"
            }
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
        /*
        * The corresponding user is found in the repository by its id and returned as a user model.
        * */
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
        /*
        * Username and password inputs are checked.
        * If the new password input is provided and confirmed, the password is changed.
        * If no password is given, the password is not changed.
        * If something goes wrong, an error message is send and no changed are made to the user.
        * If the username is changed, the change will be saved to the repository.
        * */
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