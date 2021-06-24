package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface userRepository : JpaRepository<User, Int> {
    //Selects a user, where the username is like the entered username.
    @Query("FROM User where username = :username")
    fun findByUsername(@Param("username") username: String): User?

    //Selects a user where the id is like the entered id.
    @Query("FROM User where id = :id")
    fun findUserById(@Param("id") id: Int): User
}
