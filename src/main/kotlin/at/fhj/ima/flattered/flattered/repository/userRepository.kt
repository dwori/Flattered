package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.user
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface userRepository : JpaRepository<user, Int> {
    @Query("FROM user where username = :username")
    fun findByUsername(@Param("username") username: String): user?

    //TODO Wie kann man die tabellen user_flats ansprechen
    //@Query("SELECT u FROM user_flats as u WHERE flats_id = :search")
    //fun findByFlat(@Param("search")flat: Int): List<Int>

}