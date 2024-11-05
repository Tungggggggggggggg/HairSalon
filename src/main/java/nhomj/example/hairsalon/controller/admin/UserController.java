package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        model.addAttribute("newCustomer", new User());
        model.addAttribute("deleteCustomer", new User()); // Thêm deleteCustomer vào Model
        return "admin/dashboard/customer_management";
    }

    @PostMapping("/admin/customer_management/save")
    public String customerManagementSave(@ModelAttribute("newCustomer") User user) {
        this.userService.saveUser(user);
        return "redirect:/admin/customer_management";
    }

    @PostMapping("/admin/customer_management/delete")
    public String customerManagementDelete(@ModelAttribute("deleteCustomer") User user) {
        this.userService.deleteById(user.getId());  // Xóa người dùng theo ID
        return  "redirect:/admin/customer_management";
    }
}
