package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.data.FlatFormData
import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class FlatService(val flatRepository: flatRepository, val userService: UserService) {
    //Creates a new flat in the database
    fun createFlat(): flat{
        return flat()
    }
    //Finds a Flat by its id
    fun getFlat(id: Int): flat{
        return flatRepository.findById(id).get()
    }
    //Finds all flats from the database
    fun findAllFlats(): MutableList<flat>{
        return flatRepository.findAll()
    }
    //Deletes a flat from the database
    fun deleteFlat(flat: flat){
        return flatRepository.delete(flat)
    }
    //Saves changes to a flat in the database
    fun saveFlat(flat: flat): flat{
        return flatRepository.save(flat)
    }
    //Finds a flat by its id and returns all its members
    fun getFlatUsers(id: Int): Int{
        val flat = getFlat(id)
        return flat.users.size
    }
    //Finds a flat by its secretToken
    fun findFlatByToken(token: String): flat {
        return flatRepository.findByToken(token)
    }
    @Transactional
    fun saveFlatWithFormData(flatData: FlatFormData) {
        var flatEntitiy = createFlat()
        if (flatData.id != null){
            flatEntitiy = flatRepository.getOne(flatData.id!!)
        }else{
            val currentUser = userService.getCurrentUser()
            flatEntitiy.admins.add(currentUser)
            flatEntitiy.users.add(currentUser)
        }
        flatEntitiy.name = flatData.name
        flatEntitiy.address = flatData.address

        saveFlat(flatEntitiy)
        flatData.id = flatEntitiy.id
    }
    //Switches the active flat and all related views of the currentUser
    fun switchCurrentFlat(id: Int?){
        val currentUser = userService.getCurrentUser()
        if (id != null){
            currentUser.currentUserflat = getFlat(id)
            userService.saveUser(currentUser)
        }else{
            currentUser.currentUserflat = null
            userService.saveUser(currentUser)
        }
    }
    //Switches the active flat of a user, that is not the currentUser
    fun switchFlat(flatId: Int?,userId: Int){
        val user = userService.getUserById(userId).get()
        if (flatId != null){
            user.currentUserflat = getFlat(flatId)
        }else{
            user.currentUserflat = null
        }
    }

}