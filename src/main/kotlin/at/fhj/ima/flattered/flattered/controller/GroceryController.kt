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
        groceryItemRepository.save(groceryItem);
        return "redirect:/editGroceryItem?id=" + groceryItem.id
    }

    @RequestMapping("/listGrocery", method = [RequestMethod.GET])
    fun listGrocery(model: Model): String{
        model.set("groceryList", groceryItemRepository.findAll())
        return "listGrocery"
    }

    @RequestMapping("/deleteGroceryItem", method = [RequestMethod.GET])
    fun deleteGroceryItem(model: Model, @RequestParam id: Int): String{
        val groceryItem = groceryItemRepository.findById(id).get()
        groceryItemRepository.delete(groceryItem);
        model["message"] = "GroceryItem: ${groceryItem.name} has been deleted!"
        return listGrocery(model)
    }
}