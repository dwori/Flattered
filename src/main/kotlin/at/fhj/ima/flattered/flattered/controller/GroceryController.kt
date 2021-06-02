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
        //return "redirect:/editGroceryItem?id=" + groceryItem.id
        //go back to the entire list
        return "redirect:/listGrocery"
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
        model["errorMessage"] = "GroceryItem: ${groceryItem.name} has been deleted!"
        return listGrocery(model)
    }

    @RequestMapping("/checkGroceryItem",method = [RequestMethod.GET])
    fun checkGroceryItem(model: Model, @RequestParam id: Int): String{
        val groceryItem = groceryItemRepository.findById(id).get()
        if (groceryItem.done){
            groceryItem.done = false
            model["errorMessage"] = "[ ${groceryItem.name} ] has been unchecked!"
        }else{
            groceryItem.done = true
            model["message"] = "[ ${groceryItem.name} ] has been marked as checked!"
        }
        groceryItemRepository.save(groceryItem)

        //return "redirect:/listGrocery" TODO: Redirect to listGrocery + have messages show up
        return listGrocery(model) //todo with this version messages show up
    }

    @RequestMapping("/dashboard", method = [RequestMethod.GET])
    fun dashboard(model: Model): String{
        model.set("groceryList", groceryItemRepository.findAll())
        return "dashboard"
    }
}