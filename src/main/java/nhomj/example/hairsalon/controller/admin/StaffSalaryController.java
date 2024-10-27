package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.repository.StaffSalaryRepository;
import nhomj.example.hairsalon.service.StaffSalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StaffSalaryController {

    private final StaffSalaryService staffSalaryService;

    @Autowired
    public StaffSalaryController(StaffSalaryService staffSalaryService) {
        this.staffSalaryService = staffSalaryService;
    }

    @GetMapping("/admin/salary_management")
    public String salaryManagement(Model model) {
        List<StaffSalary> staffSalaries = staffSalaryService.getAllStaff();
        Double totalSalary = staffSalaryService.getTotalSalary(staffSalaries);
        model.addAttribute("staffSalarys", staffSalaries);
        model.addAttribute("totalSalary", totalSalary);
        return "admin/dashboard/salary_management";
    }
}
