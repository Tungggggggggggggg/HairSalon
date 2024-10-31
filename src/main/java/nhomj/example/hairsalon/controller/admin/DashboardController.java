package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Notification;
import nhomj.example.hairsalon.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DashboardController {

    public NotificationService notificationService;

    @Autowired
    public DashboardController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    @GetMapping("/admin")
    public String admin(Model model) {

        return "admin/dashboard/show";
    }

    @GetMapping("/admin/notification_management")
    public String notification(Model model) {
        List<Notification> notifications = this.notificationService.getAllNotifications();
        model.addAttribute("notifications", notifications);
        return "admin/dashboard/notification_management";
    }

    @GetMapping("/admin/revenue_management")
    public String revenueManagement(Model model) {
        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/response_management")
    public String responseManagement(Model model) {
        return "admin/dashboard/response_management";
    }




}
