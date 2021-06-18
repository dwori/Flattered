package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.User
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Service
import java.util.*

@Service
class UserService (val userRepository: userRepository,){
    //Finds the user, that is currently logged in
    fun getCurrentUser(): User{
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
    fun findByUsername(username: String): User?{
        return userRepository.findByUsername(username)
    }
    //Finds all flats a user is member of
    fun getUserFlats(user: User): Set<flat>? {
        return user.flats
    }
    //Saves changes of a user to the database
    fun saveUser(user: User): User{
        return userRepository.save(user)
    }
    //Finds a user by its id
    fun getUserById(id: Int): Optional<User> {
        return userRepository.findById(id)
    }
    //Creates a user in the database
    fun createUser(): User{
        return User()
    }
    //Checks if the currentuser is admin of a flat
    fun isFlatAdmin(flat: flat): Boolean{
        val currentUser = getCurrentUser()
        return flat.admins.contains(currentUser)
    }
    //Checks a list of flats
    fun isFlatAdmins(flats: List<flat>): List<Boolean>{
        var permissions = mutableListOf<Boolean>()
        for (x in flats){
            permissions.add(isFlatAdmin(x))
        }
        return permissions
    }
}