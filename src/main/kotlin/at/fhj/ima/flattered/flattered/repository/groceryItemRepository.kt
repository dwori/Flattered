package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.groceryItem
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param


interface groceryItemRepository : JpaRepository<groceryItem, Int>{
    //Selects groceryItems, where the name is like the entered search string.
    @Query("SELECT g FROM groceryItem AS g WHERE LOWER(g.name) LIKE CONCAT('%', LOWER(:search), '%')")
    fun findBySearchText(@Param("search") search: String?): List<groceryItem>

    //Selects all groceryItems, where the flat id is like the entered flat id.
    @Query("SELECT g FROM groceryItem AS g WHERE flat.id = :flat_id")
    fun findByFlat(@Param("flat_id") flat: Int): List<groceryItem>
}
