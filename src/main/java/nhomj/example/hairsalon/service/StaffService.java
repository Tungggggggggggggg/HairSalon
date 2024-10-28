package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StaffService {

    public StaffRepository staffRepository;
    public UserRepository userRepository;


    public StaffService(StaffRepository staffRepository, UserRepository userRepository) {
        this.staffRepository = staffRepository;
        this.userRepository = userRepository;
    }

    public List<User> getUserRoleStaff(User.Role role) {
        return this.userRepository.findAllByRoleNot(role);
    }


}
