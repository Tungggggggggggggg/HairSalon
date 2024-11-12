package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    StaffService staffService;

    @Autowired
    public CustomUserDetailsService(StaffService staffService) {
        this.staffService = staffService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Staff staff = this.staffService.getStaffByEmail(username);
        if (staff == null) {
            throw new UsernameNotFoundException(username);
        }
        return new User(
                staff.getEmail(),
                staff.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_"+ staff.getRole().name())));

    }
}
