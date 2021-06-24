package at.fhj.ima.flattered.flattered.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class ContactController {

    @RequestMapping("/contact", method = [RequestMethod.GET])
    fun contactUs(): String? {
        return "contact"
    }

}