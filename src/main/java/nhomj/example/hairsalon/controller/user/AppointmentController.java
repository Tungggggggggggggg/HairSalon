package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.service.user.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @GetMapping("user/appointments")
    public String getAppointments(Model model) {
        List<Map<String, Object>> appointments = appointmentService.getAllAppointments();
        model.addAttribute("appointments", appointments);
        return "user/appointments";
    }
}





