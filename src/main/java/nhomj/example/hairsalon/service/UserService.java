package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User findOneById(long id) {
        return this.userRepository.findOneById(id);
    }

    public Optional<User> findOneByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User saveUser(User user) {
        user.setCreatedDate(getCurrentDateTime());
        return this.userRepository.save(user);
    }

    public void deleteById(long id) {
        this.userRepository.deleteById(id);
    }

    public LocalDateTime getCurrentDateTime(){
        return LocalDateTime.now();
    }
}
