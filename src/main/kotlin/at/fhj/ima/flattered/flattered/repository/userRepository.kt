package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.user
import org.springframework.data.jpa.repository.JpaRepository

interface userRepository : JpaRepository<user, Int> {

}