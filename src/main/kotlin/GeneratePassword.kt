import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

fun main() {
    print(BCryptPasswordEncoder().encode("test123"));
}