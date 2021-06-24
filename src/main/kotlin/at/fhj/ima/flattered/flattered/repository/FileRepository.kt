package at.fhj.ima.flattered.flattered.repository

import at.fhj.ima.flattered.flattered.entity.File
import org.springframework.data.jpa.repository.JpaRepository

interface FileRepository : JpaRepository<File, Int> {

}
