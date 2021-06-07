package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes


@Controller
class GroceryController(val groceryItemRepository: groceryItemRepository) {

    @RequestMapping("/editGroceryItem", method = [RequestMethod.GET])
    fun editGroceryItem(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val groceryItem = groceryItemRepository.findById(id).get()
            model["groceryItem"] = groceryItem
        } else {
            val newGroceryItem = groceryItem()
            model["groceryItem"] = newGroceryItem
        }
        return "editGroceryItem"
    }

    @RequestMapping("/changeGroceryItem", method = [RequestMethod.POST])
    fun changeGroceryItem(@ModelAttribute groceryItem: groceryItem): String {
        groceryItemRepository.save(groceryItem)
        //go back to the entire list
        return "redirect:/listGrocery"
    }

    @RequestMapping("/listGrocery", method = [RequestMethod.GET])
    fun listGrocery(model: Model): String{
        model.set("groceryList", groceryItemRepository.findAll())
        return "listGrocery"
    }

    @RequestMapping("/deleteGroceryItem", method = [RequestMethod.GET])
    fun deleteGroceryItem(model: Model, @RequestParam id: Int, redirectAttributes: RedirectAttributes): String{
        val groceryItem = groceryItemRepository.findById(id).get()
        groceryItemRepository.delete(groceryItem)
        val message = "GroceryItem: ${groceryItem.name} has been deleted!"
        redirectAttributes.addFlashAttribute("errorMessage", message)
        return "redirect:/listGrocery"
    }

    @RequestMapping("/checkGroceryItem",method = [RequestMethod.GET])
    fun checkGroceryItem(model: Model, @RequestParam id: Int,redirectAttributes: RedirectAttributes): String{
        val groceryItem = groceryItemRepository.findById(id).get()
        if (groceryItem.done){
            groceryItem.done = false
            val message = "[ ${groceryItem.name} ] has been unchecked!"
            redirectAttributes.addFlashAttribute("errorMessage",message)
        }else{
            groceryItem.done = true
            val message = "[ ${groceryItem.name} ] has been marked as checked!"
            redirectAttributes.addFlashAttribute("message",message)
        }
        groceryItemRepository.save(groceryItem)

        return "redirect:/listGrocery"
    }

    @RequestMapping("/dashboard", method = [RequestMethod.GET])
    fun dashboard(model: Model): String{
        model.set("groceryList", groceryItemRepository.findAll())
        return "dashboard"
    }
}