package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.user
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface userRepository : JpaRepository<user, Int> {
    @Query("FROM user where username = :username")
    fun findByUsername(@Param("username") username: String): user?
}
