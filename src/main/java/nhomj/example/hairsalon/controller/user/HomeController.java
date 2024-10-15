package nhomj.example.hairsalon.controller.user; // Thay đổi package theo cấu trúc dự án của bạn

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    // Phương thức này sẽ xử lý yêu cầu GET tới "/home"
    @GetMapping("/home")
    public String home() {
        return "user/home"; // Trả về tên file JSP (home.jsp)
    }
}


