package nhomj.example.hairsalon.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/admin")
    public String admin() {
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/notification")
    public String notification(Model model) {

        return "admin/notification/show";
    }

    @GetMapping("/admin/notification/create")
    public String createNotification(Model model) {

        return "admin/notification/create";
    }

    @GetMapping("/admin/notification/update")
    public String updateNotification(Model model) {

        return "admin/notification/update";
    }

    @GetMapping("/admin/notification/delete")
    public String deleteNotification(Model model) {

        return "admin/notification/delete";
    }

    @GetMapping("/admin/notification/detail")
    public String detailNotification(Model model) {

        return "admin/notification/detail";
    }

    @GetMapping("/admin/customer_management")
    public String customerManagement(Model model) {
        return "admin/dashboard/customer_management";
    }

    @GetMapping("/admin/service_management")
    public String serviceManagement(Model model) {
        return "admin/dashboard/service_management";
    }

    @GetMapping("/admin/staff_management")
    public String Management(Model model) {
        return "admin/dashboard/staff_management";
    }

    @GetMapping("/admin/booking_management")
    public String calendarManagement(Model model) {
        return "admin/dashboard/booking_management";
    }

    @GetMapping("/admin/revenue_management")
    public String revenueManagement(Model model) {
        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/response_management")
    public String responseList(Model model) {
        return "admin/dashboard/response_management";
    }

}
