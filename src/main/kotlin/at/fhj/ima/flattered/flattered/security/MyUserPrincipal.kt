package at.fhj.ima.flattered.flattered.security


import at.fhj.ima.flattered.flattered.entity.User
import at.fhj.ima.flattered.flattered.entity.userRole
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

class MyUserPrincipal(val user: User) : UserDetails {
    //je nach permission anpassbar
    override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
        val authorities = HashSet<GrantedAuthority>()
        if (user.userRole == userRole.ROLE_ADMIN) {
            authorities.add(SimpleGrantedAuthority("ROLE_ADMIN"))
        }
        authorities.add(SimpleGrantedAuthority("ROLE_USER"))
        return authorities
    }

    override fun isEnabled(): Boolean {
        return true;
    }

    override fun getUsername(): String? {
        return user.username;
    }

    override fun isCredentialsNonExpired(): Boolean {
        return true;
    }

    override fun getPassword(): String? {
        return user.password;
    }

    override fun isAccountNonExpired(): Boolean {
        return true;
    }

    override fun isAccountNonLocked(): Boolean {
        return true;
    }

}