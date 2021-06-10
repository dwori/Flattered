package at.fhj.ima.flattered.flattered.entity

import org.jetbrains.annotations.NotNull
import java.io.Serializable
import javax.persistence.*

enum class userRole{
    ROLE_USER,
    ROLE_ADMIN
}

@Entity
class user(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = true)
    var username: String,
    var password: String,
    @ManyToMany(mappedBy = "users")
    var flats: Set<flat>? = null,
    @Enumerated(EnumType.STRING)
    var userRole: userRole = at.fhj.ima.flattered.flattered.entity.userRole.ROLE_USER,
    @ManyToMany(mappedBy = "admins")
    var adminstratedFlats: Set<flat>? = null,
    @ManyToOne
    var currentUserflat: flat? = null
): Comparable<user>{

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