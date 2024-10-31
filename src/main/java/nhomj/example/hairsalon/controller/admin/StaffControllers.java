package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.model.UserStaffDTO;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class StaffControllers {

    public final StaffService staffService;
    public final UserService userService;

    @Autowired
    public StaffControllers(StaffService staffService, UserService userService) {
        this.staffService = staffService;
        this.userService = userService;
    }

    @GetMapping("/admin/staff_management")
    public String staffManagement(Model model) {
        List<UserStaffDTO> userStaffDTOS = this.staffService.getAllUserStaffDTO();
        model.addAttribute("staffs", userStaffDTOS);
        model.addAttribute("newStaff", new UserStaffDTO());
        model.addAttribute("deleteStaff", new UserStaffDTO());
        return "admin/dashboard/staff_management";
    }

    //Dùng để lưu khi tạo nhân viên mới và lưa khi chỉnh sửa nhân viên
    @PostMapping("/admin/staff_management/save")
    public String saveStaff(@ModelAttribute("newStaff") UserStaffDTO newStaff, Model model) {
        User user = this.userService.findOneById(newStaff.getId());
        newStaff.setCreatedDate(this.staffService.date());
        newStaff.setRole(User.Role.NHANVIEN);
        if(user != null) {
            this.staffService.updateUserStaff(newStaff);
        }else {
            this.staffService.saveUserStaff(newStaff);
        }
        return "redirect:/admin/staff_management";
    }


    @PostMapping("/admin/staff_management/delete")
    public String deleteStaff(@ModelAttribute("deleteStaff") UserStaffDTO deleteStaff, Model model) {
        this.staffService.deleteUserStaff(deleteStaff.getId());
        return "redirect:/admin/staff_management";
    }

}
