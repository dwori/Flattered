package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.service.GroceryService
import at.fhj.ima.flattered.flattered.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes


@Controller
class GroceryController(val groceryService: GroceryService, val userService: UserService) {

    @RequestMapping("/editGroceryItem", method = [RequestMethod.GET])
    fun editGroceryItem(model: Model, @RequestParam(required = false) id: Int?): String {
        //TEst
        if (id != null) {
            val groceryItem = groceryService.findById(id)
            model["groceryItem"] = groceryItem
        } else {
            val newGroceryItem = groceryService.createGroceryItem()
            model["groceryItem"] = newGroceryItem
            model["currentUser"] = userService.getCurrentUser()
            newGroceryItem.flat = userService.getCurrentUser().currentUserflat
        }
        return "editGroceryItem"
    }

    @RequestMapping("/changeGroceryItem", method = [RequestMethod.POST])
    fun changeGroceryItem(@ModelAttribute groceryItem: groceryItem, redirectAttributes: RedirectAttributes): String {

        if (groceryItem.name != "" && groceryItem.amount != null){
            groceryService.saveGroceryItem(groceryItem)
            val message = "Grocery ${groceryItem.name} successfully added to your Grocery List!"
            redirectAttributes.addFlashAttribute("message", message)
        } else {
            val message = "You must name your Grocery and set an amount for it!"
            redirectAttributes.addFlashAttribute("errorMessage", message)
            return "redirect:/editGroceryItem"
        }
        return "redirect:/listGrocery"
    }

    @RequestMapping("/listGrocery", method = [RequestMethod.GET])
    fun listGrocery(model: Model, @RequestParam(required = false) search: String? = null): String{
        if (search != null) {
            model["groceryList"] = groceryService.findAllSearch(search)
        }else{
            model["groceryList"] = groceryService.findAll()
        }

        model["currentUser"] = userService.getCurrentUser()

        userService.getCurrentUser().currentUserflat?.let { model.set("currentUserFlat", it) }
        return "listGrocery"
    }

    @RequestMapping("/deleteGroceryItem", method = [RequestMethod.GET])
    fun deleteGroceryItem(model: Model, @RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        val groceryItem = groceryService.findById(id)
        groceryService.deleteGroceryItem(groceryItem)
        val message = "GroceryItem: ${groceryItem.name} has been deleted!"
        redirectAttributes.addFlashAttribute("errorMessage", message)
        return "redirect:/listGrocery"
    }

    @RequestMapping("/checkGroceryItem",method = [RequestMethod.GET])
    fun checkGroceryItem(model: Model, @RequestParam id: Int,redirectAttributes: RedirectAttributes): String{
        val groceryItem = groceryService.findById(id)
        if (groceryItem.done){
            groceryItem.done = false
            val message = "[ ${groceryItem.name} ] has been unchecked!"
            redirectAttributes.addFlashAttribute("errorMessage",message)
        }else{
            groceryItem.done = true
            val message = "[ ${groceryItem.name} ] has been marked as checked!"
            redirectAttributes.addFlashAttribute("message",message)
        }
        groceryService.saveGroceryItem(groceryItem)

        return "redirect:/listGrocery"
    }
}