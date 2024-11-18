package nhomj.example.hairsalon.service;

import jakarta.persistence.EntityNotFoundException;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class StaffService {

    public StaffRepository staffRepository;
    public UserRepository userRepository;
    public UpLoadService upLoadService;

    @Autowired
    public StaffService(StaffRepository staffRepository, UserRepository userRepository, UpLoadService upLoadService) {
        this.staffRepository = staffRepository;
        this.userRepository = userRepository;
        this.upLoadService = upLoadService;
    }

    /**
     * Lấy danh sách tất cả nhân viên.
     *
     * @return danh sách nhân viên
     */
    public List<Staff> getAllStaff() {
        return this.staffRepository.findAll();
    }

    /**
     * Lấy nhân viên dựa trên ID.
     *
     * @param id ID của nhân viên
     * @return Đối tượng Staff nếu tìm thấy, ngược lại trả về null
     */
    public Staff getStaffById(long id) {
        return this.staffRepository.findById(id);
    }

    /**
     * Lấy thời gian hiện tại.
     *
     * @return Thời gian hiện tại dưới dạng LocalDateTime
     */
    public LocalDateTime date(){
        return LocalDateTime.now();
    }

    /**
     * Lưu thông tin nhân viên vào cơ sở dữ liệu.
     *
     * @param staff Đối tượng Staff cần lưu
     */
    public void saveStaff(Staff staff) {
        staffRepository.save(staff);
    }

    /**
     * Xóa nhân viên dựa trên ID.
     *
     * @param staff Đối tượng Staff chứa ID nhân viên cần xóa
     */
    public void deleteStaff(Staff staff) {
        Staff checkStaff = getStaffById(staff.getId());
        System.out.println(checkStaff.getAvatar());
        upLoadService.deleteFile(checkStaff.getAvatar(),"avatar" );
        staffRepository.delete(checkStaff);
    }

    /**
     * Lấy nhân viên dựa trên email.
     *
     * @param email Email của nhân viên
     * @return Đối tượng Staff nếu tìm thấy, ngược lại trả về null
     */
    public Staff getStaffByEmail(String email) {
        return this.staffRepository.findStaffByEmail(email);
    }
    
    /**
     * Lấy danh sách nhân viên theo vai trò.
     *
     * @param role Vai trò của nhân viên
     * @return danh sách nhân viên theo vai trò
     */
    public List<Staff> getStaffByRole(Staff.Role role) {
        return staffRepository.findByRole(role);
    }
}
