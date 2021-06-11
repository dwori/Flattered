package at.fhj.ima.flattered.flattered.controller.advice


import at.fhj.ima.flattered.flattered.repository.userRepository
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute


@ControllerAdvice
class CurrentUserControllerAdvice(val userService: UserService) {

    @ModelAttribute
    fun addCurrentUser(model: Model) {

        val auth = SecurityContextHolder.getContext().authentication
        val username = auth.name

        val currentUser = userService.findByUsername(username)
        model.addAttribute("currentUser", currentUser)
    }
}
