package at.fhj.ima.flattered.flattered.converter

import at.fhj.ima.flattered.flattered.entity.User
import at.fhj.ima.flattered.flattered.repository.userRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component


@Component
class StringToUserConverter(val userRepository: userRepository): Converter<String, User?> {
    override fun convert(source: String): User? {
        if (source.isNullOrBlank()){
            return null
        }
        return userRepository.getOne(Integer.parseInt(source))
    }

}