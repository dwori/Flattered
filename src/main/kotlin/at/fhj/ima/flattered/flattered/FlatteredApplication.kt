package at.fhj.ima.flattered.flattered

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class FlatteredApplication

fun main(args: Array<String>) {
	runApplication<FlatteredApplication>(*args)
}
