package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.groceryItem
import at.fhj.ima.flattered.flattered.repository.flatRepository
import at.fhj.ima.flattered.flattered.repository.groceryItemRepository
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.stereotype.Service

@Service
class GroceryService(val groceryItemRepository: groceryItemRepository, val flatRepository: flatRepository, val userService: UserService) {

    fun findByFlat(id: Int):List<groceryItem>{
        return groceryItemRepository.findByFlat(id)
    }
    fun deleteGroceryItem(groceryItem: groceryItem){
        return groceryItemRepository.delete(groceryItem)
    }
    fun findById(id: Int): groceryItem{
        return groceryItemRepository.findById(id).get()
    }
    fun createGroceryItem(): groceryItem{
        return groceryItem()
    }
    fun saveGroceryItem(groceryItem: groceryItem): groceryItem{
        return groceryItemRepository.save(groceryItem)
    }
    fun findAll(): List<groceryItem>{
        return groceryItemRepository.findAll()
    }
    fun findAllSearch(search: String?): List<groceryItem>{
        return groceryItemRepository.findBySearchText(search)
    }
}