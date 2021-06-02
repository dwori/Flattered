package at.fhj.ima.flattered.flattered.entity

import org.jetbrains.annotations.NotNull
import java.io.Serializable
import javax.persistence.*

@Entity
class user(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = true)
    @field:NotNull
    var name: String? = null,
    @ManyToMany
    var flats: Set<flat>? = null
): Comparable<user>, Serializable {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as user
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

    override fun compareTo(other: user): Int {
        return compareValues(id, other.id)
    }
}