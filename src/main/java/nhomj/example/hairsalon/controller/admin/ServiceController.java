package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.ServiceShopService;
import nhomj.example.hairsalon.service.UpLoadService;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ServiceController {
    public final ServiceShopService serviceShopService;
    public final UpLoadService upLoadService;

    @Autowired
    public ServiceController(ServiceShopService serviceShopService , UpLoadService upLoadService) {
        this.serviceShopService = serviceShopService;
        this.upLoadService = upLoadService;
    }

    @GetMapping("/admin/service_management")
    public String showService(Model model) {
        List<Service> serviceShops = this.serviceShopService.getAllServiceShops();
        model.addAttribute("services", serviceShops);
        model.addAttribute("newService", new Service());
        model.addAttribute("deleteService", new Service());
        return "admin/dashboard/service_management";
    }

    @PostMapping("/admin/service_management/save")
    public String saveService(Model model,@ModelAttribute("newService") Service service , @RequestParam("file") MultipartFile file) {
        String avatar = this.upLoadService.handleSaveUploadFile(file, "service");
        Service checkService = serviceShopService.getServiceById(service.getId());
        if(checkService != null) {
            checkService.setAvatar(avatar);
            checkService.setName(service.getName());
            checkService.setDescription(service.getDescription());
            checkService.setPrice(service.getPrice());
            checkService.setDurationMinutes(service.getDurationMinutes());
            this.serviceShopService.saveService(checkService);
        }else{
            service.setAvatar(avatar);
            this.serviceShopService.saveService(service);
        }
        return "redirect:/admin/service_management";
    }

    @PostMapping("/admin/service_management/delete")
    public String deleteService(Model model,@ModelAttribute("deleteService") Service service) {

        this.serviceShopService.deleteServiceById(service.getId());
        return "redirect:/admin/service_management";
    }

}
