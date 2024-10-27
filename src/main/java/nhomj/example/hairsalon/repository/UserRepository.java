package nhomj.example.hairsalon.repository;

import  nhomj.example.hairsalon.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByNameAndPassword(String name, String password);

    List<User> findAllByRole(User.Role role);

    List<User> findAllByRoleNot(User.Role role);
}
