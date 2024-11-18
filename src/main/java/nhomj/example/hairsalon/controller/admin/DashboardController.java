package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.FeedbackListService;
import nhomj.example.hairsalon.service.RevenueService;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class DashboardController {
    private final BookingService bookingService;
    private final UserService userService;
    private final FeedbackListService feedbackListService;


    @Autowired
    public DashboardController( BookingService bookingService, UserService userService, FeedbackListService feedbackListService) {
        this.bookingService = bookingService;
        this.userService = userService;
        this.feedbackListService = feedbackListService;
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        long countFeedback = this.feedbackListService.numberOfFeedbackList();
        long countBooking = this.bookingService.countBooking();
        List<Booking> bookings = this.bookingService.getAllBookings();
        List<User> users = this.userService.getAllUsers();
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
        model.addAttribute("countFeedback", countFeedback);
        model.addAttribute("countBooking", countBooking);
        model.addAttribute("bookings", bookings);
        model.addAttribute("users", users);
        model.addAttribute("doanhthu", tongDoanhThu);
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/feedback_management")
    public String notification(Model model) {
        List<FeedbackList> feedbackLists = this.feedbackListService.getAllFeedbackList();
        model.addAttribute("feedbacks", feedbackLists);
        model.addAttribute("deleteFeedback", new FeedbackList());
        return "admin/dashboard/feedback_management";
    }

    @PostMapping("/admin/feedback/delete")
    public String deleteNotification(FeedbackList feedbackList) {
        this.feedbackListService.deleteFeedbackList(feedbackList);
        return "redirect:/admin/feedback_management";
    }








    @GetMapping("/admin/response_management")
    public String responseManagement(Model model) {
        return "admin/dashboard/response_management";
    }




}