package nhomj.example.hairsalon.controller.user; 


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookingController {

    @GetMapping("/booking")
    public String showBookingPage() {
        return "user/booking";
    }
}
