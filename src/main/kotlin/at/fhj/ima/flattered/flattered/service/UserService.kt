package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
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
    fun findByUsername(username: String): user?{
        return userRepository.findByUsername(username)
    }
    fun getUserFlats(user: user): Set<flat>? {
        return user.flats
    }
    fun saveUser(user: user): user{
        return userRepository.save(user)
    }
}