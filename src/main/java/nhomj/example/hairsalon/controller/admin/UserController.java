package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class UserController {

    public UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/customer_management")
    public String customerManagement(Model model) {
        List<User> users = this.userService.findAllByRole(User.Role.CUSTOMER);
        model.addAttribute("users", users);
        return "admin/dashboard/customer_management";
    }
}
