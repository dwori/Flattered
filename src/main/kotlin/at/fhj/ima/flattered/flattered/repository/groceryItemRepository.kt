package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.groceryItem
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface groceryItemRepository : JpaRepository<groceryItem, Int>{
    @Query("FROM groceryItem WHERE id = id ")
    fun findBySearchText(@Param("search") search: String?): List<groceryItem>
}