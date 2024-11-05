package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

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

    public User saveUser(User user) {
        user.setCreatedDate(LocalDateTime.now());
        return this.userRepository.save(user);
    }

    public void deleteById(long id) {
        this.userRepository.deleteById(id);
    }

    public LocalDateTime date(){
        return LocalDateTime.now();
    }
}
