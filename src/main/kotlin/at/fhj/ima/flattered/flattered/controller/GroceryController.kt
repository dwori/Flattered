package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.repository.groceryListRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.validation.annotation.Validated
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

    fun populateEditGroceryView(model: Model): String {
        //todo fix function
        //model.set("groceryList", groceryListRepository.findAll())
        return "editGroceryItem"
    }

    //todo
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
        model["message"] = "GroceryItem: ${groceryItem.name} has been deleted!"
        return listGrocery(model)
    }

    @RequestMapping("/checkGroceryItem",method = [RequestMethod.GET])
    fun checkGroceryItem(model: Model, @RequestParam id: Int): String{
        val groceryItem = groceryItemRepository.findById(id).get()
        if (groceryItem.done){
            groceryItem.done = false
            model["message"] = "${groceryItem.name} has been unchecked!"
        }else{
            groceryItem.done = true
            model["message"] = "${groceryItem.name} has been marked as checked!"
        }
        groceryItemRepository.save(groceryItem)

        return listGrocery(model)
    }
}