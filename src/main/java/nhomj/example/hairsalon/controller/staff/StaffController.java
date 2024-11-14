package nhomj.example.hairsalon.controller.staff;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class StaffController {

    private final StaffService staffService;

    @Autowired
    public StaffController(StaffService staffService) {
        this.staffService = staffService;
    }

    @GetMapping("/staff")
    public String staff(Model model,  Authentication authentication) {
        Staff loggedInStaff = staffService.getStaffByEmail(authentication.getName());
        model.addAttribute("loggedInStaff", loggedInStaff);
        model.addAttribute("staffList", staffService.getAllStaff());
        return "staff/staff"; // Hiển thị danh sách nhân viên
    }

    @GetMapping("/Staff_Salary")
    public String staffSalary(Model model, @AuthenticationPrincipal Staff loggedInStaff) {
        model.addAttribute("loggedInStaff", loggedInStaff);
        return "staff/Staff_Salary";
    }

    @GetMapping("/Staff_Information/{id}") // Change to dynamic ID
    public String staffInformation(@PathVariable Long id, Model model, @AuthenticationPrincipal Staff loggedInStaff) {
        model.addAttribute("loggedInStaff", loggedInStaff);
        Staff staff = staffService.getStaffById(id);
        if (staff != null) {
            model.addAttribute("staff", staff);
            return "staff/Staff_Information"; // Hiển thị thông tin chi tiết của nhân viên
        } else {
            // Handle case where staff not found
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Redirect to error page
        }
    }
}