package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.ServiceShopService;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class UserServiceController {

    private final ServiceShopService serviceShopService;
    private final StaffService staffService;

    @Autowired
    public UserServiceController(ServiceShopService serviceShopService, StaffService staffService) {
        this.serviceShopService = serviceShopService;
        this.staffService = staffService;
    }

    /**
     * Hiển thị danh sách tất cả các dịch vụ.
     * @param model đối tượng Model để lưu danh sách dịch vụ.
     * @return trang danh sách dịch vụ (service.jsp).
     */
    @GetMapping("/service")
    public String getAllServices(Model model) {
        List<Service> services = serviceShopService.getAllServiceShops();
        model.addAttribute("services", services);
        return "user/service"; // Trang service.jsp hiển thị danh sách tất cả dịch vụ
    }

    /**
     * Hiển thị chi tiết dịch vụ dựa trên ID.
     * @param id ID của dịch vụ.
     * @param model đối tượng Model để lưu thông tin dịch vụ.
     * @return trang chi tiết dịch vụ (service.jsp).
     */
    @GetMapping("/service/{id}")
    public String getServiceDetail(@PathVariable Long id, Model model) {
        Service service = serviceShopService.getServiceById(id);
        model.addAttribute("service", service);
        return "user/service-detail"; // Trang service-detail.jsp hiển thị thông tin chi tiết dịch vụ
    }

    @GetMapping("/detail_staff/{id}")
    public String getDetailStaff(@PathVariable Long id, Model model) {
        Staff staff = this.staffService.getStaffById(id);
        model.addAttribute("staff", staff);
        return "user/staff-detail";
    }
}
