package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAll();

    User save(User user);

    User findOneById(Long id);
    
    Optional<User> findByEmail(String email); // Đã thêm phương thức tìm kiếm theo email
}
