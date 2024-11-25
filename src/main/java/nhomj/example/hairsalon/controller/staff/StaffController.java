package nhomj.example.hairsalon.controller.staff;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.BookingEvent;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.StaffSalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class StaffController {

    private final StaffService staffService;
    private final StaffSalaryService staffSalaryService;
    private final BookingService bookingService;

    @Autowired
    public StaffController(StaffService staffService, StaffSalaryService staffSalaryService, BookingService bookingService) {
        this.staffService = staffService;
        this.staffSalaryService = staffSalaryService;
        this.bookingService = bookingService;
    }

    private void addLoggedInStaffToModel(Model model, Authentication authentication) {
        if (authentication != null) {
            String email = authentication.getName();
            Staff loggedInStaff = staffService.getStaffByEmail(email);
            if (loggedInStaff != null) {
                model.addAttribute("loggedInStaff", loggedInStaff);
            } else {
                model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            }
        }
    }


    @GetMapping("/staff")
    public String staffDashboard(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        return "staff/staff";
    }

    @GetMapping("/staff/salary")
    public String staffSalary(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            List<StaffSalary> salaryList = staffSalaryService.getStaffSalaryByStaffId(loggedInStaff.getId());
            model.addAttribute("salaryList", salaryList);
            return "staff/Staff_Salary";
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error";
        }
    }

    @GetMapping("/staff/information")
    public String staffInformation(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            model.addAttribute("staff", loggedInStaff);
            return "staff/Staff_Information";
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Trang lỗi
        }
    }

    @GetMapping("/staff/bookings")
    public String myBookings(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            List<Booking> bookings = bookingService.getBookingsByStaffId(loggedInStaff.getId());
            model.addAttribute("bookingList", bookings);
            return "staff/Staff_Booking";
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Trang lỗi
        }
    }

    @GetMapping("/staff/bookings/events")
    public @ResponseBody List<BookingEvent> getStaffBookings(Authentication authentication) {
        if (authentication == null) {
            return new ArrayList<>();
        }

        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff == null) {
            return new ArrayList<>();
        }

        List<Booking> bookings = bookingService.getBookingsByStaffId(loggedInStaff.getId());
        List<BookingEvent> events = new ArrayList<>();

        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        for (Booking booking : bookings) {
            if (booking.getStatus() == Booking.Status.DaHuy || booking.getStatus() == Booking.Status.HoanThanh) {
                continue;
            }
            String services = booking.getServices().stream()
                    .map(Service::getName) 
                    .collect(Collectors.joining(", "));
            String title = services;
            LocalDateTime startDateTime = booking.getDate().atTime(booking.getAppointmentTime());
            LocalDateTime endDateTime = startDateTime.plusHours(1);
            String start = startDateTime.format(formatter);
            String end = endDateTime.format(formatter);
            String customerName = booking.getCustomer().getName();
            String status = booking.getStatusDisplayName();
            BookingEvent event = new BookingEvent(title, start, end, customerName, status);
            events.add(event);
        }
        return events;
    }

}
