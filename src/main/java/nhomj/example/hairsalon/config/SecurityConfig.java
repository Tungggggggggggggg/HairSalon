package nhomj.example.hairsalon.config;

import jakarta.servlet.DispatcherType;
import nhomj.example.hairsalon.service.CustomUserDetailsService;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(StaffService staffService) {
        return new CustomUserDetailsService(staffService);
    }

    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {

        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
         http
                 .authorizeHttpRequests(authorize -> authorize
                         .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                 DispatcherType.INCLUDE)
                         .permitAll()
                         .requestMatchers("/login",
                                 "/home/**",
                                 "/admin_style/**",
                                 "/staff_style/**",
                                 "/user_style/**",
                                 "/images/**"
                         ).permitAll()
                         .requestMatchers("/admin/**").hasRole("Admin")
                         .anyRequest().authenticated())

                 .formLogin(formLogin -> formLogin
                         .loginPage("/login")
                         .failureUrl("/login?error")
                         .successHandler(customSuccessHandler())
                         .permitAll())
                 .exceptionHandling(ex -> ex.accessDeniedPage("/accessdenied"));
         return http.build();

    }
}
