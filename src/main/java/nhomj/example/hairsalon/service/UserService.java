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
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Lấy danh sách tất cả người dùng, sắp xếp theo ngày tạo mới nhất.
     *
     * @return danh sách người dùng
     */
    public List<User> getAllUsers() {
        return this.userRepository.findAllByOrderByCreatedDateDesc();
    }

    /**
     * Tìm người dùng dựa trên ID.
     *
     * @param id ID của người dùng
     * @return đối tượng User nếu tìm thấy, ngược lại trả về null
     */
    public User findOneById(Long id) {
        return this.userRepository.findOneById(id);
    }

    /**
     * Xóa người dùng dựa trên ID.
     *
     * @param id ID của người dùng cần xóa
     */
    public void deleteById(Long id) {
        this.userRepository.deleteById(id);
    }

    /**
     * Tìm người dùng dựa trên email.
     *
     * @param email Email của người dùng
     * @return Optional chứa User nếu tìm thấy, ngược lại Optional.empty()
     */
    public Optional<User> findOneByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    /**
     * Lưu thông tin người dùng vào cơ sở dữ liệu.
     *
     * @param user Đối tượng User cần lưu
     */
    public void saveUser(User user) {
        userRepository.save(user);
    }

    /**
     * Lấy thời gian hiện tại.
     *
     * @return Thời gian hiện tại dưới dạng LocalDateTime
     */
    public LocalDateTime getCurrentDateTime() {
        return LocalDateTime.now();
    }
}
