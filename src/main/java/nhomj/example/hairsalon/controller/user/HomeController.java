package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.FeedbackListService;
import nhomj.example.hairsalon.service.ServiceShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class HomeController {
    private final ServiceShopService serviceShopService;
    private final FeedbackListService feedbackListService;

    @Autowired
    public HomeController(ServiceShopService serviceShopService, FeedbackListService feedbackListService) {
        this.serviceShopService = serviceShopService;
        this.feedbackListService = feedbackListService;
    }

    @GetMapping("/home")
    public String showHomePage(Model model) {
        List<Service> services = serviceShopService.getAllServiceShops(); // Lấy danh sách dịch vụ
        model.addAttribute("services", services); // Đưa danh sách vào model
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

    @GetMapping("report/sucess")
    public String showSucessPage(Model model) {
        return "user/home";
    }
}
