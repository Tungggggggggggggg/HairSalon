package nhomj.example.hairsalon.controller.admin;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.http.HttpServletResponse;
import nhomj.example.hairsalon.service.UpLoadService;
import nhomj.example.hairsalon.service.exportToExCelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;

@Controller
public class StaffControllers {

    public final StaffService staffService;
    public final UpLoadService upLoadService;
    public final PasswordEncoder passwordEncoder;
    public final exportToExCelService exportToExCelService;

    @Autowired
    public StaffControllers(StaffService staffService, UpLoadService upLoadService, PasswordEncoder passwordEncoder, exportToExCelService exportToExCelService) {
        this.staffService = staffService;
        this.upLoadService = upLoadService;
        this.passwordEncoder = passwordEncoder;
        this.exportToExCelService = exportToExCelService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        binder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(LocalDate.parse(text, dateFormatter));
            }
        });
    }

    /**
     * Hiển thị trang quản lý nhân viên.
     *
     * @param model Đối tượng Model để truyền dữ liệu đến view
     * @return Trang staff_management.jsp
     */
    @GetMapping("/admin/staff_management")
    public String staffManagement(Model model) {
        List<Staff> staffs = this.staffService.getAllStaff();
        model.addAttribute("staffs", staffs);
        model.addAttribute("newStaff", new Staff());
        model.addAttribute("deleteStaff", new Staff());
        return "admin/dashboard/staff_management";
    }

    /**
     * Xử lý lưu thông tin nhân viên mới hoặc cập nhật nhân viên hiện tại.
     *
     * @param staff Đối tượng Staff chứa thông tin nhân viên
     * @param file  Tệp avatar tải lên
     * @return Chuyển hướng đến trang quản lý nhân viên
     */
    @PostMapping("/admin/staff_management/save")
    public String saveStaff(@ModelAttribute("newStaff") Staff staff, @RequestParam("file") MultipartFile file) {
        String avatar = "";
        if (!file.isEmpty()) {
            avatar = this.upLoadService.handleSaveUploadFile(file, "avatar");
        }
        Staff checkStaff = null;
        if (staff.getId() != null) {
            checkStaff = staffService.getStaffById(staff.getId());
        }
        if (checkStaff != null) {
            checkStaff.setName(staff.getName());
            checkStaff.setEmail(staff.getEmail());
            checkStaff.setPhone(staff.getPhone());
            checkStaff.setAddress(staff.getAddress());
            if (avatar != null && !avatar.isEmpty()) {
                checkStaff.setAvatar(avatar);
            }
            checkStaff.setPassword(staff.getPassword());
            checkStaff.setRole(staff.getRole());
            checkStaff.setBirthday(staff.getBirthday());
            checkStaff.setGender(staff.getGender());
            checkStaff.setExperience(staff.getExperience());
            staffService.saveStaff(checkStaff);
        } else {
            staff.setPassword(this.passwordEncoder.encode(staff.getPassword()));
            staff.setAvatar(avatar);
            // Đã loại bỏ dòng sau để cho phép thiết lập vai trò từ form
            // staff.setRole(Staff.Role.NhanVien);
            staffService.saveStaff(staff);
        }
        return "redirect:/admin/staff_management";
    }

    /**
     * Xử lý xóa nhân viên dựa trên ID.
     *
     * @param staff Đối tượng Staff chứa ID nhân viên cần xóa
     * @param model Đối tượng Model để truyền dữ liệu đến view nếu cần
     * @return Chuyển hướng đến trang quản lý nhân viên
     */
    @PostMapping("/admin/staff_management/delete")
    public String deleteStaff(@ModelAttribute("deleteStaff") Staff staff, Model model) {
        this.staffService.deleteStaff(staff);
        return "redirect:/admin/staff_management";
    }

    @GetMapping("/admin/staff_management/excel")
    public String staffManagementExcel(HttpServletResponse response) throws IOException {
        List<Staff> staffs = this.staffService.getAllStaff();

        byte[] excelFile = exportToExCelService.exportStaffToExcel(staffs);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=DanhsachNhanvien.xlsx");

        OutputStream os = response.getOutputStream();
        os.write(excelFile);
        os.flush();
        os.close();

        return "redirect:/admin/staff_management";
    }

}
