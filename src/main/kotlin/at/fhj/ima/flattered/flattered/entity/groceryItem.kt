package at.fhj.ima.flattered.flattered.entity


import org.jetbrains.annotations.NotNull
import java.io.Serializable
import javax.persistence.*



@Entity
class groceryItem(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = true)
    @field:NotNull
    var name: String? = null,
    @field:NotNull
    var done: Boolean = false,
    @field:NotNull
    var amount: Int? = null,
    //@field:NotNull
    var requestedBy: String? = null,
    var comment: String? = null,
    @ManyToOne @field:NotNull
    var groceryList: GroceryList? = null
): Comparable<groceryItem>, Serializable {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as groceryItem
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

    override fun compareTo(other: groceryItem): Int {
        return compareValues(id, other.id)
    }
}