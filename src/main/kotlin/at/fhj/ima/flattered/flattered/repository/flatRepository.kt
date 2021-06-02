package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.groceryItem
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface flatRepository : JpaRepository<flat, Int>{
    @Query("FROM flat WHERE id = id ")
    fun findBySearchText(@Param("search") search: String?): List<flat>
}