package at.fhj.ima.flattered.flattered.controller

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam


@Controller
class FlatController(val flatRepository: flatRepository, val groceryItemRepository: groceryItemRepository, val userRepository: userRepository) {

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
    @Secured("FLAT_ADMIN","ROLE_ADMIN")
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
    @Secured("ROLE_ADMIN")
    @RequestMapping("/deleteFlat", method = [RequestMethod.GET])
    fun deleteFlat(model: Model, @RequestParam id: Int): String{
        val flat = flatRepository.findById(id).get()
        //flatRepository.deleteByFlat(id)
        //flatRepository.deleteByFlat2(id)
        for (x in groceryItemRepository.findByFlat(id)){
            groceryItemRepository.delete(x)
        }
        /*for (x in userRepository.findByFlat(id)){
            //todo löschen von user_flats beziehungen
        }*/
        flatRepository.delete(flat);
        model["errorMessage"] = "Flat: ${flat.name} has been deleted!"
        return listFlat(model)
    }
}