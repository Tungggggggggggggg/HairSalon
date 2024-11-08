package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/booking_management")
public class BookingsController {

    private final BookingService bookingService;

    @Autowired
    public BookingsController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping
    public String showBookingManagementPage(Model model) {
        model.addAttribute("bookings", bookingService.getAllBookings());
        model.addAttribute("services", bookingService.getAllServices());
        model.addAttribute("booking", new Booking());
        return "admin/dashboard/booking_management";
    }

    @PostMapping("/save")
    public String saveBooking(@ModelAttribute("booking") Booking booking) {
        bookingService.saveBooking(booking);
        return "redirect:/admin/booking_management";
    }
}
