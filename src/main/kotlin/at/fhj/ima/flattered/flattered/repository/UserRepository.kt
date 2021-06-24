package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface userRepository : JpaRepository<User, Int> {
    @Query("FROM User where username = :username")
    fun findByUsername(@Param("username") username: String): User?

    @Query("FROM User where id = :id")
    fun findUserById(@Param("id") id: Int): User
}
