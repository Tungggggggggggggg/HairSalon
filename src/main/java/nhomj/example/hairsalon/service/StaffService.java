package nhomj.example.hairsalon.service;

import jakarta.persistence.EntityNotFoundException;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.model.UserStaffDTO;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
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

//    public List<Staff> getAllStaff() {
//        return this.staffRepository.findAll();
//    }
//    public Staff getStaffById(long id) {
//        return this.staffRepository.findOne(id);
//    }

    public List<UserStaffDTO> getAllUserStaffDTO() {
        return this.staffRepository.findAllUserStaffs();
    }

    public LocalDateTime date(){
        return LocalDateTime.now();
    }

    public void saveUserStaff(UserStaffDTO userStaffDTO) {
        // Chuyển đổi UserStaffDTO thành User
        User user = new User();
        user.setId(userStaffDTO.getId());
        user.setName(userStaffDTO.getName());
        user.setEmail(userStaffDTO.getEmail());
        user.setPassword(userStaffDTO.getPassword());
        user.setPhone(userStaffDTO.getPhone());
        user.setAddress(userStaffDTO.getAddress());
        user.setGender(userStaffDTO.getGender());
        user.setBirthday(userStaffDTO.getBirthday());
        user.setRole(userStaffDTO.getRole());
        user.setCreatedDate(userStaffDTO.getCreatedDate());

        // Lưu User vào cơ sở dữ liệu
        User savedUser = userRepository.save(user);

        // Chuyển đổi UserStaffDTO thành Staff
        Staff staff = new Staff();
        staff.setExperience(userStaffDTO.getExperience());
        staff.setSpecialty(userStaffDTO.getSpecialty());
        staff.setStatus(userStaffDTO.getStatus());
        staff.setUser(savedUser); // Gán user vào staff để đảm bảo quan hệ

        // Lưu Staff vào cơ sở dữ liệu
        staffRepository.save(staff);
    }

    public void deleteUserStaff(Long userId) {
        if (userRepository.existsById(userId)) {
            userRepository.deleteById(userId);
        } else {
            throw new EntityNotFoundException("User với ID " + userId + " không tồn tại.");
        }
    }

    public void updateUserStaff(UserStaffDTO userStaffDTO) {
        // Tìm User trong cơ sở dữ liệu dựa trên ID từ DTO
        User user = userRepository.findById(userStaffDTO.getId())
                .orElseThrow(() -> new EntityNotFoundException("User với ID " + userStaffDTO.getId() + " không tồn tại."));

        // Cập nhật thông tin User từ DTO
        user.setName(userStaffDTO.getName());
        user.setEmail(userStaffDTO.getEmail());
        user.setPassword(userStaffDTO.getPassword());
        user.setPhone(userStaffDTO.getPhone());
        user.setAddress(userStaffDTO.getAddress());
        user.setGender(userStaffDTO.getGender());
        user.setBirthday(userStaffDTO.getBirthday());
        user.setRole(userStaffDTO.getRole());
        user.setCreatedDate(userStaffDTO.getCreatedDate());

        // Lưu User đã cập nhật vào cơ sở dữ liệu
        userRepository.save(user);

        // Tìm Staff dựa trên User
        Staff staff = staffRepository.findByUser(user)
                .orElseThrow(() -> new EntityNotFoundException("Staff với User ID " + userStaffDTO.getId() + " không tồn tại."));

        // Cập nhật thông tin Staff từ DTO
        staff.setExperience(userStaffDTO.getExperience());
        staff.setSpecialty(userStaffDTO.getSpecialty());
        staff.setStatus(userStaffDTO.getStatus());

        // Lưu Staff đã cập nhật vào cơ sở dữ liệu
        staffRepository.save(staff);
    }
}
