// HomeController.java
package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.ServiceShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    private final ServiceShopService serviceShopService;

    @Autowired
    public HomeController(ServiceShopService serviceShopService) {
        this.serviceShopService = serviceShopService;
    }

    @GetMapping("/home")
    public String showHomePage(Model model) {
        List<Service> services = serviceShopService.getAllServiceShops(); // Lấy danh sách dịch vụ
        model.addAttribute("services", services); // Đưa danh sách vào model
        return "user/home"; // Trả về view "home.jsp"
    }
}
