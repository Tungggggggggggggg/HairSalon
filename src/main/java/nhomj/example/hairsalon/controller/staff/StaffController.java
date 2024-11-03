package nhomj.example.hairsalon.controller.staff; // Thay đổi package theo cấu trúc dự án của bạn

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class StaffController {

    @GetMapping("/staff")
    public String satff() {
        return "staff/staff";
    }

    @GetMapping("/Staff_Salary")
    public String StaffSalary() {
        return "staff/Staff_Salary";
    }

    @GetMapping("/Staff_Information")
    public String StaffInformation() {
        return "staff/Staff_Information";
    }
}


