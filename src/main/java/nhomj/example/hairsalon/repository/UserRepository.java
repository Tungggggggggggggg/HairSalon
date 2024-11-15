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
    
    /**
     * Tìm người dùng dựa trên email.
     *
     * @param email Email của người dùng
     * @return Optional chứa User nếu tìm thấy, ngược lại Optional.empty()
     */
    Optional<User> findByEmail(String email);

    // Các phương thức khác đã được kế thừa từ JpaRepository
}
