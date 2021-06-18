package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.user
import at.fhj.ima.flattered.flattered.repository.flatRepository
import org.springframework.stereotype.Service

@Service
class FlatService(val flatRepository: flatRepository) {
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

}