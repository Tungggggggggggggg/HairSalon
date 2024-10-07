package nhomj.example.hairsalon.controller;

import nhomj.example.hairsalon.model.Booking;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BookingController {

    // Hiển thị form đặt lịch
    @GetMapping("/booking")
    public String showBookingForm(Model model) {
        Booking booking = new Booking();
        model.addAttribute("booking", booking);
        return "booking_form";
    }

    // Xử lý form khi khách hàng gửi yêu cầu
    @PostMapping("/booking")
    public String submitBooking(@ModelAttribute("booking") Booking booking, Model model) {
        model.addAttribute("name", booking.getName());
        model.addAttribute("phone", booking.getPhone());
        model.addAttribute("service", booking.getService());
        return "booking_success";  // Trang kết quả thành công
    }
}
