package at.fhj.ima.flattered.flattered.data

import org.jetbrains.annotations.NotNull
import javax.persistence.Column

class FlatFormData (
    var id: Int? = null,
    @field:NotNull
    var name: String? = null,
    @field:NotNull
    var address: String? = null,
){

}