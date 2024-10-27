package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.ServiceShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ServiceController {
    public final ServiceShopService serviceShopService;

    @Autowired
    public ServiceController(ServiceShopService serviceShopService) {
        this.serviceShopService = serviceShopService;
    }

    @GetMapping("/admin/service_management")
    public String showService(Model model) {
        List<Service> serviceShops = this.serviceShopService.getAllServiceShops();
        model.addAttribute("serviceShops", serviceShops);
        return "admin/dashboard/service_management";
    }


}
