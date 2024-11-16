package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.service.StaffSalaryService;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StaffSalaryController {

    private final StaffSalaryService staffSalaryService;
    private final StaffService staffService;

    @Autowired
    public StaffSalaryController(StaffSalaryService staffSalaryService, StaffService staffService) {
        this.staffSalaryService = staffSalaryService;
        this.staffService = staffService;
    }

    @GetMapping("/admin/salary_management")
    public String salaryManagement(Model model) {
        List<StaffSalary> staffSalaries = staffSalaryService.getAllStaff();
        List<Staff> staffList = staffSalaryService.getAllStaffName(); // Ensure this method is implemented
        model.addAttribute("staffList", staffList);
        Double totalSalary = staffSalaryService.getTotalSalary(staffSalaries);
        model.addAttribute("staffSalarys", staffSalaries);
        model.addAttribute("newSalary", new StaffSalary());
        model.addAttribute("totalSalary", totalSalary);
        return "admin/dashboard/salary_management";
    }

    @PostMapping("/admin/salary_management/save")
    public String saveSalary(@ModelAttribute("newSalary") StaffSalary staffSalary, @RequestParam Long staffId, Model model) {
        try {
            Staff staff = staffService.getStaffById(staffId);
            staffSalary.setStaff(staff);
            staffSalaryService.saveStaffSalary(staffSalary);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error saving salary: " + e.getMessage());
            return "admin/dashboard/salary_management"; // Trả về trang với thông báo lỗi
        }
        return "redirect:/admin/salary_management";
    }
}
