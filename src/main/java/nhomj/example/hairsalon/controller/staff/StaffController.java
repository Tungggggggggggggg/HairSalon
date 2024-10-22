package nhomj.example.hairsalon.controller.staff; // Thay đổi package theo cấu trúc dự án của bạn

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class StaffController {

    // Phương thức này sẽ xử lý yêu cầu GET tới "/home"
    @GetMapping("/staff")
    public String home() {
        return "staff/staff"; // Trả về tên file JSP (home.jsp)
    }
}


