package nhomj.example.hairsalon.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller


public class BookingController {

    @GetMapping("/user/appointments")
    public String viewAppointments() {
        return "user/appointments";  // Trả về trang appointments.jsp
    }
}
