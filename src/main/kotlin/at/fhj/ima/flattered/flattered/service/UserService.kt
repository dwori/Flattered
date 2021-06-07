package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.user
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Service

@Service
class UserService (val userRepository: userRepository){
    fun getCurrentUser(): user{
        val auth = SecurityContextHolder.getContext().authentication
        val username = auth.name
        val currentUser = userRepository.findByUsername(username)
        if (currentUser != null){
            return currentUser
        }
        else{
            throw Exception("No current User!")
        }
    }
}