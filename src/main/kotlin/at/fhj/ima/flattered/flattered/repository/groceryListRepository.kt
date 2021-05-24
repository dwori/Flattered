package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.GroceryList
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface groceryListRepository: JpaRepository<GroceryList, Int>{

}