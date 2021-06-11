package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.entity.user
import at.fhj.ima.flattered.flattered.repository.flatRepository
import org.springframework.stereotype.Service

@Service
class FlatService(val flatRepository: flatRepository) {
    fun createFlat(): flat{
        return flat()
    }

    fun getFlat(id: Int): flat{
        return flatRepository.findById(id).get()
    }

    fun findAllFlats(): MutableList<flat>{
        return flatRepository.findAll()
    }

    fun deleteFlat(flat: flat){
        return flatRepository.delete(flat)
    }
    fun saveFlat(flat: flat): flat{
        return flatRepository.save(flat)
    }
    fun getFlatUsers(id: Int): Int{
        val flat = getFlat(id)
        return flat.users.size
    }


}