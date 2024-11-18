package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.NotificationService;
import nhomj.example.hairsalon.service.RevenueService;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class DashboardController {
    private final RevenueService revenueService;
    private final BookingService bookingService;
    public NotificationService notificationService;
    private final UserService userService;

    @Autowired
    public DashboardController(RevenueService revenueService, BookingService bookingService, NotificationService notificationService, UserService userService) {
        this.revenueService = revenueService;
        this.bookingService = bookingService;
        this.notificationService = notificationService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        long countReven = this.revenueService.countReven();
        long countBooking = this.bookingService.countBooking();
        long countNotication = this.notificationService.countNotifications();

        List<Booking> bookings = this.bookingService.getAllBookings();
        List<User> users = this.userService.getAllUsers();
        List<Revenue> revenues = this.revenueService.getAllRevenues();
        List<BigDecimal> week = revenueService.getRevenueByWeek();
        List<BigDecimal> month  = revenueService.getRevenueByMonth();
        double tongDoanhThu = 0;
        if(bookings != null)
        {
            for(Booking booking : bookings)
            {
                List<Service> services = booking.getServices();
                for(Service service : services)
                {
                      tongDoanhThu += service.getPrice().doubleValue();
                }

            }
        }
        model.addAttribute("countReven", countReven);
        model.addAttribute("countBooking", countBooking);
        model.addAttribute("countNotication", countNotication);
        model.addAttribute("bookings", bookings);
        model.addAttribute("users", users);
        model.addAttribute("revenues", revenues);
        model.addAttribute("week", week);
        model.addAttribute("month", month);
        model.addAttribute("doanhthu", tongDoanhThu);

        return "admin/dashboard/show";
    }

    @GetMapping("/admin/notification_management")
    public String notification(Model model) {
        List<FeedbackList> notifications = this.notificationService.getAllNotifications();
        model.addAttribute("notifications", notifications);
        model.addAttribute("newNotification", new FeedbackList());
        model.addAttribute("deleteNotification", new FeedbackList());
        return "admin/dashboard/notification_management";
    }








    @GetMapping("/admin/response_management")
    public String responseManagement(Model model) {
        return "admin/dashboard/response_management";
    }




}