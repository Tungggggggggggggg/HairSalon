package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.awt.print.Book;
import java.util.List;

@Controller
public class BookingsController {

    private final BookingService bookingService;

    @Autowired
    public BookingsController(final BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("/admin/booking_management")
    public String calendarManagement(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        return "admin/dashboard/booking_management";
    }
}
