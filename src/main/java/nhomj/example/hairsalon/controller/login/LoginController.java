package nhomj.example.hairsalon.controller.login;

import nhomj.example.hairsalon.model.User;
import  nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@Controller
public class LoginController {

    private UserService userService;

    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "admin/login";
    }

    @GetMapping("/accessdenied")
    public String getDenyPage() {
        return "admin/deny";
    }
}