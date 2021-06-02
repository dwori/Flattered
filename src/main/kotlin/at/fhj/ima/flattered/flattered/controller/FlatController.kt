package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam


@Controller
class FlatController(val flatRepository: flatRepository) {

    @RequestMapping("/editFlat", method = [RequestMethod.GET])
    fun editFlat(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val flat = flatRepository.findById(id).get()
            model["flat"] = flat
        } else {
            val newFlat = flat()
            model["flat"] = newFlat
        }
        return "editFlat"
    }

    @RequestMapping("/changeFlat", method = [RequestMethod.POST])
    fun changeFlat(@ModelAttribute flat: flat): String {
        flatRepository.save(flat);
        //return "redirect:/editGroceryItem?id=" + groceryItem.id
        //go back to the entire list
        return "redirect:/listFlat"
    }

    @RequestMapping("/listFlat", method = [RequestMethod.GET])
    fun listFlat(model: Model): String{
        model.set("flatList", flatRepository.findAll())
        return "listFlat"
    }

    @RequestMapping("/deleteFlat", method = [RequestMethod.GET])
    fun deleteFlat(model: Model, @RequestParam id: Int): String{
        val flat = flatRepository.findById(id).get()
        flatRepository.delete(flat);
        model["errorMessage"] = "Flat: ${flat.name} has been deleted!"
        return listFlat(model)
    }
}