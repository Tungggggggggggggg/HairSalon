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

    /**
     * Thêm thông tin nhân viên đăng nhập vào Model.
     *
     * @param model           đối tượng Model để truyền dữ liệu đến view
     * @param authentication đối tượng Authentication chứa thông tin người dùng đăng nhập
     */
    private void addLoggedInStaffToModel(Model model, Authentication authentication) {
        if (authentication != null) {
            String email = authentication.getName(); // Giả sử email là tên đăng nhập
            Staff loggedInStaff = staffService.getStaffByEmail(email);
            if (loggedInStaff != null) {
                model.addAttribute("loggedInStaff", loggedInStaff);
            } else {
                // Xử lý nếu không tìm thấy nhân viên
                model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            }
        }
    }

    /**
     * Hiển thị trang chính của nhân viên, bao gồm lịch làm việc.
     *
     * @param model           đối tượng Model để truyền dữ liệu đến view
     * @param authentication đối tượng Authentication chứa thông tin người dùng đăng nhập
     * @return Trang staff/staff.jsp
     */
    @GetMapping("/staff")
    public String staffDashboard(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        return "staff/staff"; // Trang staff.jsp hiển thị lịch làm việc
    }

    /**
     * Hiển thị trang thông tin lương của nhân viên đăng nhập.
     *
     * @param model           đối tượng Model để truyền dữ liệu đến view
     * @param authentication đối tượng Authentication chứa thông tin người dùng đăng nhập
     * @return Trang staff/Staff_Salary.jsp
     */
    @GetMapping("/staff/salary")
    public String staffSalary(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            List<StaffSalary> salaryList = staffSalaryService.getStaffSalaryByStaffId(loggedInStaff.getId());
            model.addAttribute("salaryList", salaryList);
            return "staff/Staff_Salary"; // Hiển thị danh sách lương
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Trang lỗi
        }
    }

    /**
     * Hiển thị trang thông tin chi tiết của nhân viên đăng nhập.
     *
     * @param model           đối tượng Model để truyền dữ liệu đến view
     * @param authentication đối tượng Authentication chứa thông tin người dùng đăng nhập
     * @return Trang staff/Staff_Information.jsp
     */
    @GetMapping("/staff/information")
    public String staffInformation(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            model.addAttribute("staff", loggedInStaff);
            return "staff/Staff_Information"; // Hiển thị thông tin chi tiết của nhân viên
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Trang lỗi
        }
    }

    /**
     * Hiển thị trang lịch hẹn của nhân viên đăng nhập.
     *
     * @param model           đối tượng Model để truyền dữ liệu đến view
     * @param authentication đối tượng Authentication chứa thông tin người dùng đăng nhập
     * @return Trang staff/Staff_Booking.jsp
     */
    @GetMapping("/staff/bookings")
    public String myBookings(Model model, Authentication authentication) {
        addLoggedInStaffToModel(model, authentication);
        String email = authentication.getName();
        Staff loggedInStaff = staffService.getStaffByEmail(email);

        if (loggedInStaff != null) {
            List<Booking> bookings = bookingService.getBookingsByStaffId(loggedInStaff.getId());
            model.addAttribute("bookingList", bookings);
            return "staff/Staff_Booking"; // Hiển thị danh sách lịch hẹn
        } else {
            model.addAttribute("errorMessage", "Nhân viên không tồn tại.");
            return "error"; // Trang lỗi
        }
    }

    /**
     * API Endpoint để lấy danh sách lịch hẹn của nhân viên dưới dạng JSON.
     *
     * @param authentication Đối tượng Authentication chứa thông tin người dùng đăng nhập
     * @return Danh sách các BookingEvent
     */
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
            if (booking.getStatus() == Booking.Status.DaHuy) {
                continue; // Bỏ qua các lịch hẹn đã hủy
            }

            String services = booking.getServices().stream()
                    .map(Service::getName) 
                    .collect(Collectors.joining(", "));
            String title = services;

            LocalDateTime startDateTime = booking.getDate().atTime(booking.getAppointmentTime());
            LocalDateTime endDateTime = startDateTime.plusHours(1); // Giả sử mỗi lịch hẹn kéo dài 1 giờ

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
