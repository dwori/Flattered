package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.repository.flatRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.stereotype.Service

@Service

class GroceryService(val groceryItemRepository: groceryItemRepository, val flatRepository: flatRepository) {
    //Finds a groceryItem by the flat_id it belongs to
    fun findByFlat(id: Int):List<groceryItem>{
        return groceryItemRepository.findByFlat(id)
    }
    //Deletes a groceryItem from the database
    fun deleteGroceryItem(groceryItem: groceryItem){
        return groceryItemRepository.delete(groceryItem)
    }
    //Finds a groceryItem by its id
    fun findById(id: Int): groceryItem{
        return groceryItemRepository.findById(id).get()
    }
    //Creates a new groceryItem in the database
    fun createGroceryItem(): groceryItem{
        return groceryItem()
    }
    //Saves changes for a groceryItem to the database
    fun saveGroceryItem(groceryItem: groceryItem): groceryItem{
        return groceryItemRepository.save(groceryItem)
    }
    //Finds all groceryItems
    fun findAll(): List<groceryItem>{
        return groceryItemRepository.findAll()
    }
    fun findAllSearch(search: String?): List<groceryItem>{
        return groceryItemRepository.findBySearchText(search)
    }
}