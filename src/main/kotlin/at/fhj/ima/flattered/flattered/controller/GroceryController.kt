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
class GroceryController(val groceryService: GroceryService,
                        val userService: UserService) {

    @RequestMapping("/editGroceryItem", method = [RequestMethod.GET])
    fun editGroceryItem(model: Model, @RequestParam(required = false) id: Int?): String {
        /*
        * Checks if the id of the incoming item is null.
        * If this is true a new item will be created, if not than the item with the responding id is loaded.
        */
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
        /*
         * Saves changes to the repository. In advance a null check for the name and the amount field is executed.
         * Further messages are set for the case that holds true. After that the Grocery List will be displayed.
         */
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
        /*
         * Fills the groceryList model depending on the input of the searchbar or fills in all items.
         * Only items from the users current flat get displayed.
         */
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
        /*
         * An item is required by its id and thehn gets deleted. Additionally a message is set to inform the user, that
         * the action was successful.
         */
        val groceryItem = groceryService.findById(id)
        groceryService.deleteGroceryItem(groceryItem)
        val message = "GroceryItem: ${groceryItem.name} has been deleted!"
        redirectAttributes.addFlashAttribute("errorMessage", message)
        return "redirect:/listGrocery"
    }

    @RequestMapping("/checkGroceryItem",method = [RequestMethod.GET])
    fun checkGroceryItem(model: Model, @RequestParam id: Int,redirectAttributes: RedirectAttributes): String{
        /*
         * Selects a groceryItem by its id and switches its status (done) field.
         * An additional message is set too, to inform the user to which state he switched to.
         */
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