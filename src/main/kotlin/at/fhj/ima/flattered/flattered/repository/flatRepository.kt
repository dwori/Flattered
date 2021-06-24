package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.groceryItem
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface flatRepository : JpaRepository<flat, Int>{
    //Selects a flat where the token is like the entered token
    @Query("FROM flat WHERE secretToken = :token")
    fun findByToken(@Param("token") token: String?): flat

}