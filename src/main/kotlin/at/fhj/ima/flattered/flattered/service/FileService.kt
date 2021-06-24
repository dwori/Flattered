package at.fhj.ima.flattered.flattered.service

import at.fhj.ima.flattered.flattered.entity.File
import at.fhj.ima.flattered.flattered.repository.FileRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardOpenOption

@Service
class FileService(val fileRepository: FileRepository) {
    fun save(file: File): File {
        /*
        * The file is saved to the repository.
        * */
        return fileRepository.save(file)
    }

    @Transactional
    fun createFile(dto: MultipartFile): File {
        /*
        * An empty multipart file is filled and returned as a File
        * */
        val file = convertMultipartFileToFile(dto)
        this.save(file)
        val path = this.retrievePath(file.id!!).toAbsolutePath()
        if (!Files.exists(path)) {
            Files.createFile(path)
        }
        Files.write(path, dto.bytes, StandardOpenOption.WRITE)
        return file
    }

    fun convertMultipartFileToFile(dto: MultipartFile): File {
        /*
        * A Multipart file is converted to a File and returned.
        * */
        return File(contentType = dto.contentType, size = dto.size, originalFileName = dto.originalFilename)
    }

    fun retrievePath(id: Int): Path {
        /*
        * The file Path is found by its id.
        * */
        return Paths.get("files/$id")
    }

    fun findById(id: Int): File {
        /*
        * The File is found by its id.
        * */
        return fileRepository.findById(id).get()
    }

    fun delete(id: Int) {
        /*
        * The File is deleted from the Repository.
        * */
        fileRepository.delete(findById(id))
    }
}
