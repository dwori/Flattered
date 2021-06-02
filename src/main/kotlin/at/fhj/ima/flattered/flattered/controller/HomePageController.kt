package at.fhj.ima.flattered.flattered.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod


@Controller
class HomePageController {
    @RequestMapping("",method = [RequestMethod.GET])
    fun homePage(): String{
        return "redirect:dashboard"
    }
}