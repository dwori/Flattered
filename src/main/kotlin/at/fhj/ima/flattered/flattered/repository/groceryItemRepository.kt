package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.groceryItem
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param


interface groceryItemRepository : JpaRepository<groceryItem, Int>{
    @Query("SELECT g FROM groceryItem AS g WHERE LOWER(g.name) LIKE CONCAT('%', LOWER(:search), '%')")
    fun findBySearchText(@Param("search") search: String?): List<groceryItem>

    //Used to delete all groceryItems that are connected to the flat id
    @Query("SELECT g FROM groceryItem AS g WHERE flat.id = :flat_id")
    fun findByFlat(@Param("flat_id") flat: Int): List<groceryItem>
}
