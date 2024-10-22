package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public User authenticate(String username, String password) {
        // Kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
        return userRepository.findByUsernameAndPassword(username, password); // Phương thức này cần được cài đặt trong UserRepository
    }
}
