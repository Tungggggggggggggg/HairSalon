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

    /**
     * Hiển thị trang quản lý khách hàng.
     *
     * @param model Đối tượng Model để truyền dữ liệu đến view
     * @return Trang customer_management.jsp
     */
    @GetMapping("/admin/customer_management")
    public String customerManagement(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        model.addAttribute("newCustomer", new User());
        model.addAttribute("deleteCustomer", new User()); // Thêm deleteCustomer vào Model
        return "admin/dashboard/customer_management";
    }

    /**
     * Xử lý lưu thông tin khách hàng mới hoặc cập nhật khách hàng hiện tại.
     *
     * @param user Đối tượng User chứa thông tin khách hàng
     * @return Chuyển hướng đến trang quản lý khách hàng
     */
    @PostMapping("/admin/customer_management/save")
    public String customerManagementSave(@ModelAttribute("newCustomer") User user) {
        this.userService.saveUser(user);
        return "redirect:/admin/customer_management";
    }

    /**
     * Xử lý xóa khách hàng dựa trên ID.
     *
     * @param id ID của khách hàng cần xóa
     * @return Chuyển hướng đến trang quản lý khách hàng
     */
    @PostMapping("/admin/customer_management/delete")
    public String deleteCustomer(@ModelAttribute("deleteCustomer") User user) {
        this.userService.deleteById(user.getId());
        return "redirect:/admin/customer_management";
    }

}
