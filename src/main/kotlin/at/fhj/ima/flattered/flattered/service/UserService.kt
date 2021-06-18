package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.user
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import java.util.*

@Service
class UserService (val userRepository: userRepository, val flatService: FlatService){
    //Finds the user, that is currently logged in
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
    //Finds a user by its username
    fun findByUsername(username: String): user?{
        return userRepository.findByUsername(username)
    }
    //Finds all flats a user is member of
    fun getUserFlats(user: user): Set<flat>? {
        return user.flats
    }
    //Saves changes of a user to the database
    fun saveUser(user: user): user{
        return userRepository.save(user)
    }
    //Finds a user by its id
    fun getUserById(id: Int): Optional<user> {
        return userRepository.findById(id)
    }
    //Switches the active flat and all related views of the currentUser
    fun switchCurrentFlat(id: Int?){
        val currentUser = getCurrentUser()
        if (id != null){
            currentUser.currentUserflat = flatService.getFlat(id)
            saveUser(currentUser)
        }else{
            currentUser.currentUserflat = null
            saveUser(currentUser)
        }
    }
    fun createUser(): user{
        return user()
    }
}