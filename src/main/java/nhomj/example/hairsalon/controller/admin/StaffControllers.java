package nhomj.example.hairsalon.controller.admin;

import java.util.List;

import nhomj.example.hairsalon.service.UpLoadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @Autowired
    public StaffControllers(StaffService staffService, UpLoadService upLoadService, PasswordEncoder passwordEncoder) {
        this.staffService = staffService;
        this.upLoadService = upLoadService;
        this.passwordEncoder = passwordEncoder;

    }

    @GetMapping("/admin/staff_management")
    public String staffManagement(Model model) {
        List<Staff> staffs = this.staffService.getAllStaff();
        model.addAttribute("staffs", staffs);
        model.addAttribute("newStaff", new Staff());
        model.addAttribute("deleteStaff", new Staff());
        return "admin/dashboard/staff_management";
    }

    //Dùng để lưu khi tạo nhân viên mới và lưa khi chỉnh sửa nhân viên
    @PostMapping("/admin/staff_management/save")
    public String saveStaff(@ModelAttribute("newStaff") Staff staff,@RequestParam("file") MultipartFile file) {
        String avatar = this.upLoadService.handleSaveUploadFile(file, "avatar");
        String password = this.passwordEncoder.encode(staff.getPassword());
        Staff checkStaff = null;
        if(staff.getId() != null) {
            checkStaff = staffService.getStaffById(staff.getId());
        }
        if(checkStaff != null) {
            checkStaff.setName(staff.getName());
            checkStaff.setEmail(staff.getEmail());
            checkStaff.setPhone(staff.getPhone());
            checkStaff.setAddress(staff.getAddress());
            if(avatar != null) {
                checkStaff.setAvatar(avatar);
            }
            if(password != staff.getPassword()) {
                checkStaff.setPassword(password);
            }
            checkStaff.setRole(staff.getRole());
            staffService.saveStaff(staff);
        }else{
            staff.setPassword(password);
            staff.setAvatar(avatar);
            staff.setRole(Staff.Role.NhanVien);
            staffService.saveStaff(staff);
        }
        return "redirect:/admin/staff_management";
    }


    @PostMapping("/admin/staff_management/delete")
    public String deleteStaff(@ModelAttribute("deleteStaff") Staff staff, Model model) {
        this.staffService.deleteStaff(staff);
        return "redirect:/admin/staff_management";
    }

}
