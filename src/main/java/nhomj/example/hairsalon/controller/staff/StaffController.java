package nhomj.example.hairsalon.controller.staff;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.StaffSalaryService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class StaffController {

    private final StaffService staffService;
    private final StaffSalaryService staffSalaryService;

    @Autowired
    public StaffController(StaffService staffService, StaffSalaryService staffSalaryService) {
        this.staffService = staffService;
        this.staffSalaryService = staffSalaryService;

    }

    private void addLoggedInStaffToModel(Model model, Authentication authentication) {
        if (authentication != null) {
            Staff loggedInStaff = staffService.getStaffByEmail(authentication.getName());
            model.addAttribute("loggedInStaff", loggedInStaff);
        }
    }


    @GetMapping("/staff")
    public String staff(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model,authentication);
        model.addAttribute("staffList", staffService.getAllStaff());
        return "staff/staff"; // Hiển thị danh sách nhân viên
    }

    @GetMapping("/Staff_Salary/{id}")
    public String staffSalary(@PathVariable Long id,Model model, Authentication authentication) {
        addLoggedInStaffToModel(model,authentication);

        // Fetch salary list for the logged-in staff
        List<StaffSalary> salaryList = staffSalaryService.getStaffSalaryByStaffId(id);
        model.addAttribute("salaryList", salaryList);

        return "staff/Staff_Salary";
    }

    @GetMapping("/Staff_Information/{id}") // Change to dynamic ID
    public String staffInformation(@PathVariable Long id, Model model, Authentication authentication) {
        addLoggedInStaffToModel(model,authentication);
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
