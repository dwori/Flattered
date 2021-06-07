package at.fhj.ima.flattered.flattered.entity


import org.jetbrains.annotations.NotNull
import java.io.Serializable
import java.util.*
import javax.persistence.*



@Entity
class flat(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = true)
    @field:NotNull
    var name: String? = null,
    @field:NotNull
    var address: String? = null,
    @ManyToMany
    var users: MutableSet<user> = mutableSetOf(),
    @Column(updatable = false)
    var secretToken: String = UUID.randomUUID().toString().replace("-", ""),
    @ManyToMany
    var admins: MutableSet<user> = mutableSetOf(),
): Comparable<flat>, Serializable {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as flat
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

    override fun compareTo(other: flat): Int {
        return compareValues(id, other.id)
    }
}