package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StaffControllers {

    public final StaffService staffService;

    @Autowired
    public StaffControllers(StaffService staffService) {
        this.staffService = staffService;
    }

    @GetMapping("/admin/staff_management")
    public String Management(Model model) {
        List<User> staffs = this.staffService.getUserRoleStaff(User.Role.CUSTOMER);
        model.addAttribute("staffs", staffs);
        return "admin/dashboard/staff_management";
    }
}
