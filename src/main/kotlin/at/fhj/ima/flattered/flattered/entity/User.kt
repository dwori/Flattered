package at.fhj.ima.flattered.flattered.entity


import javax.persistence.*
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

enum class userRole{
    ROLE_USER,
    ROLE_ADMIN
}

/*
 * This class holds the fields for the users
 */

@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "username_UK", columnNames = ["username"])])
class User(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false)
    @field:NotNull
    @field:Size(min = 3, max = 240)
    var username: String? = null,
    @NotEmpty
    @field:Size(min = 3, max = 240)
    var password: String? = null,
    @ManyToMany(mappedBy = "users")
    var flats: Set<flat>? = null,
    @Enumerated(EnumType.STRING)
    var userRole: userRole = at.fhj.ima.flattered.flattered.entity.userRole.ROLE_USER,
    @ManyToMany(mappedBy = "admins")
    var adminstratedFlats: Set<flat>? = null,
    @ManyToOne
    var currentUserflat: flat? = null,
    @ManyToMany(fetch = FetchType.EAGER)
    var files: List<File>? = null
): Comparable<User>{

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as User
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

    override fun compareTo(other: User): Int {
        return compareValues(id, other.id)
    }
}