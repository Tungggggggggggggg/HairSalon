package nhomj.example.hairsalon.service;

import jakarta.persistence.EntityNotFoundException;
import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class StaffService {

    private final StaffRepository staffRepository;
    private final UserRepository userRepository;
    private final UpLoadService upLoadService;
    private final BookingService bookingService;

    @Autowired
    public StaffService(StaffRepository staffRepository, UserRepository userRepository, UpLoadService upLoadService, BookingService bookingService) {
        this.staffRepository = staffRepository;
        this.userRepository = userRepository;
        this.upLoadService = upLoadService;
        this.bookingService = bookingService;
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
    public LocalDateTime date() {
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
        upLoadService.deleteFile(checkStaff.getAvatar(), "avatar");
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

    /**
     * Lấy danh sách nhân viên khả dụng dựa trên ngày, giờ và thời lượng.
     *
     * @param date                Ngày hẹn
     * @param time                Giờ hẹn
     * @param durationMinutes     Thời lượng dịch vụ
     * @param bookingId           ID của booking hiện tại (nếu đang chỉnh sửa)
     * @return danh sách nhân viên khả dụng
     */
    public List<Staff> getAvailableStaff(LocalDate date, LocalTime time, int durationMinutes, Long bookingId) {
        // Lấy danh sách tất cả nhân viên
        List<Staff> allStaff = staffRepository.findByRole(Staff.Role.NhanVien);

        // Kiểm tra tính khả dụng của từng nhân viên
        List<Staff> availableStaff = new ArrayList<>();
        for (Staff staff : allStaff) {
            boolean isAvailable = bookingService.isStaffAvailable(staff.getId(), date, time, durationMinutes, bookingId);
            if (isAvailable) {
                availableStaff.add(staff);
            }
        }
        return availableStaff;
    }
}
