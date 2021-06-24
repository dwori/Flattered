package at.fhj.ima.flattered.flattered.entity


import javax.validation.constraints.NotNull
import java.io.Serializable
import java.util.*
import javax.persistence.*
import javax.validation.constraints.Size


@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "name_UK", columnNames = ["name"])])
class flat(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int? = null,
    @Column(nullable = false)
    @field:NotNull
    @field:Size(min = 3, max = 240)
    var name: String? = null,
    @field:NotNull
    var address: String? = null,
    @ManyToMany
    var users: MutableSet<User> = mutableSetOf(),
    @Column(updatable = false)
    var secretToken: String = UUID.randomUUID().toString().replace("-", ""),
    @ManyToMany
    var admins: MutableSet<User> = mutableSetOf(),
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