package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.StaffSalaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.math.BigDecimal;
import java.util.Map;
import java.util.HashMap;

@Service
public class StaffSalaryService {

    private final StaffSalaryRepository staffSalaryRepository;
    private final StaffRepository staffRepository;

    @Autowired
    public StaffSalaryService(StaffSalaryRepository staffSalaryRepository, StaffRepository staffRepository) {
        this.staffSalaryRepository = staffSalaryRepository;
        this.staffRepository = staffRepository;
    }

    /**
     * Lấy tất cả các lương nhân viên.
     *
     * @return danh sách lương nhân viên
     */
    public List<StaffSalary> getAllStaffSalaries() {
        return this.staffSalaryRepository.findAll();
    }

    /**
     * Lấy danh sách nhân viên có vai trò là "NhanVien".
     *
     * @return danh sách nhân viên với vai trò "NhanVien"
     */
    public List<Staff> getAllEmployees() {
        return this.staffRepository.findByRole(Staff.Role.NhanVien);
    }

    /**
     * Lưu hoặc cập nhật lương nhân viên.
     *
     * @param staffSalary đối tượng StaffSalary cần lưu
     */
    public void saveStaffSalary(StaffSalary staffSalary) {
        staffSalaryRepository.save(staffSalary);
    }

    /**
     * Xóa lương nhân viên.
     *
     * @param staffSalary đối tượng StaffSalary cần xóa
     */
    public void deleteStaffSalary(StaffSalary staffSalary) {
        staffSalaryRepository.delete(staffSalary);
    }

    /**
     * Lấy lương nhân viên dựa trên ID.
     *
     * @param salaryId ID của lương
     * @return đối tượng StaffSalary nếu tìm thấy, ngược lại trả về null
     */
    public StaffSalary getStaffSalaryById(Long salaryId) {
        return staffSalaryRepository.findById(salaryId).orElse(null);
    }

    /**
     * Lấy lương nhân viên theo tháng và năm.
     *
     * @param month tháng
     * @param year  năm
     * @return danh sách lương nhân viên
     */
    public List<StaffSalary> getStaffSalaryByMonthYear(Integer month, Integer year) {
        return staffSalaryRepository.findByMonthAndYear(month, year);
    }

    /**
     * Lấy lương nhân viên theo tháng, năm và nhân viên.
     *
     * @param month   tháng
     * @param year    năm
     * @param staffId ID của nhân viên
     * @return danh sách lương nhân viên
     */
    public List<StaffSalary> getStaffSalaryByMonthYearStaff(Integer month, Integer year, Long staffId) {
        return staffSalaryRepository.findByMonthAndYearAndStaffId(month, year, staffId);
    }

    /**
     * Lấy lương nhân viên theo nhân viên.
     *
     * @param staffId ID của nhân viên
     * @return danh sách lương nhân viên
     */
    public List<StaffSalary> getStaffSalaryByStaffId(Long staffId) {
        return staffSalaryRepository.findByStaffId(staffId);
    }

    /**
     * Tính tổng lương từ danh sách lương nhân viên.
     *
     * @param staffSalaries danh sách lương nhân viên
     * @return tổng lương
     */
    public BigDecimal getTotalSalary(List<StaffSalary> staffSalaries) {
        BigDecimal totalSalary = BigDecimal.ZERO;
        for (StaffSalary staffSalary : staffSalaries) {
            if (staffSalary.getTotalSalary() != null) {
                totalSalary = totalSalary.add(staffSalary.getTotalSalary());
            }
        }
        return totalSalary;
    }

    /**
     * Lấy lương mới nhất cho mỗi nhân viên.
     *
     * @return danh sách lương mới nhất cho mỗi nhân viên
     */
    public List<StaffSalary> getLatestStaffSalaries() {
        List<StaffSalary> allSalaries = staffSalaryRepository.findAll();
        Map<Long, StaffSalary> latestSalariesMap = new HashMap<>();

        for (StaffSalary salary : allSalaries) {
            Long staffId = salary.getStaff().getId();
            if (!latestSalariesMap.containsKey(staffId)) {
                latestSalariesMap.put(staffId, salary);
            } else {
                StaffSalary existingSalary = latestSalariesMap.get(staffId);
                if (salary.getCreateDate().isAfter(existingSalary.getCreateDate())) {
                    latestSalariesMap.put(staffId, salary);
                }
            }
        }

        return List.copyOf(latestSalariesMap.values());
    }
}
