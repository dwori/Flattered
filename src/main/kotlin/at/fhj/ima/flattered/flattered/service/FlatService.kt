package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.flat
import at.fhj.ima.flattered.flattered.repository.flatRepository
import org.springframework.stereotype.Service

@Service
class FlatService(val flatRepository: flatRepository) {
    fun createFlat(){

    }

    fun editFlat(){

    }

    fun deleteFlat(){

    }
    fun saveFlat(flat: flat){
        flatRepository.save(flat)
    }
}