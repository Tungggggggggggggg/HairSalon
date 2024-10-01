package nhomj.example.hairsalon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String login() {
        return "login"; // Trả về trang login.jsp
    }

    @PostMapping("/login")
    public String loginPost() {
        // Xử lý đăng nhập
        return "redirect:/"; // Chuyển hướng đến trang chính sau khi đăng nhập thành công
    }

    @GetMapping("/register")
    public String register() {
        return "register"; // Trả về trang register.jsp
    }

    @PostMapping("/register")
    public String registerPost() {
        // Xử lý đăng ký
        return "redirect:/"; // Chuyển hướng đến trang chính sau khi đăng ký thành công
    }
}
