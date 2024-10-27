package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User authenticate(String username, String password) {
        // Kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
        return userRepository.findByNameAndPassword(username, password); // Phương thức này cần được cài đặt trong UserRepository
    }

    public List<User> findAllByRole(User.Role role) {
        return this.userRepository.findAllByRole(role);
    }

    public List<User> findAllByRoleNot(User.Role role) {
        return this.userRepository.findAllByRole(role);
    }

}
