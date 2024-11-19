package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.EmailService;
import nhomj.example.hairsalon.service.FeedbackListService;
import nhomj.example.hairsalon.service.ServiceShopService;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    private final ServiceShopService serviceShopService;
    private final FeedbackListService feedbackListService;
    private final StaffService staffService;

    @Autowired
    public HomeController(ServiceShopService serviceShopService, FeedbackListService feedbackListService, StaffService staffService) {
        this.serviceShopService = serviceShopService;
        this.feedbackListService = feedbackListService;
        this.staffService = staffService;
    }
    @GetMapping("")
    public String showHomePage(Model model) {
        List<Service> services = serviceShopService.getAllServiceShops();
        List<Staff> staffs = staffService.getStaffByRole(Staff.Role.NhanVien);
        model.addAttribute("services", services);
        model.addAttribute("staffs", staffs);
        return "user/home"; // Trả về view "home.jsp"
    }
    @GetMapping("/report")
    public String showReportPage(Model model) {
        model.addAttribute("feedback", new FeedbackList());
        return "user/feedback";
    }
    @PostMapping("/report/save")
    public String saveReport(Model model, @ModelAttribute("feedback") FeedbackList feedback) {
        feedbackListService.save(feedback);
        return "user/feedback_sucess";
    }
    @GetMapping("/report/sucess")
    public String showSucessPage(Model model) {
        return "redirect:/home";
    }
}
