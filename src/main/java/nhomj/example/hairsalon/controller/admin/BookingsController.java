package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class BookingsController {

    private final BookingService bookingService;
    private final UserService userService;
    private final StaffService staffService;

    @Autowired
    public BookingsController(final BookingService bookingService, final UserService userService, final StaffService staffService) {
        this.bookingService = bookingService;
        this.userService = userService;
        this.staffService = staffService;
    }

    @GetMapping("/admin/booking_management")
    public String calendarManagement(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        model.addAttribute("command", new Booking());
        model.addAttribute("cancelBooking", new Booking());
        model.addAttribute("servicesList", bookingService.getAllServices());
        model.addAttribute("staffList", staffService.getAllStaff());

        // Tạo danh sách các giờ hẹn từ 8:00 đến 21:00 cách nhau 30 phút
        List<String> appointmentTimes = new ArrayList<>();
        LocalTime start = LocalTime.of(8, 0);
        LocalTime end = LocalTime.of(21, 0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        while (!start.isAfter(end)) {
            appointmentTimes.add(start.format(formatter));
            start = start.plusMinutes(30);
        }
        model.addAttribute("appointmentTimes", appointmentTimes);

        return "admin/dashboard/booking_management";
    }

    @PostMapping("/admin/booking_management/save")
    public String saveBooking(@ModelAttribute("command") @Valid Booking booking, BindingResult bindingResult, Model model) {
        // Kiểm tra lỗi validation
        if (bindingResult.hasErrors()) {
            // Nếu có lỗi, trả về view với các lỗi
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        }

        // Đặt trạng thái mặc định là Đã Đặt nếu trạng thái chưa được thiết lập
        if (booking.getStatus() == null) {
            booking.setStatus(Booking.Status.DaDat);
        }
        if (booking.getServices() == null) {
            booking.setServices(new ArrayList<>());
        }

        // Xử lý thông tin khách hàng
        User customer = booking.getCustomer();
        if (customer != null && customer.getEmail() != null && !customer.getEmail().isEmpty()) {
            // Kiểm tra xem email có tồn tại trong DB hay không
            Optional<User> existingCustomerOpt = userService.findOneByEmail(customer.getEmail());
            if (existingCustomerOpt.isPresent()) {
                User existingCustomer = existingCustomerOpt.get();
                booking.setCustomer(existingCustomer);
            } else {
                // Nếu không tồn tại, tạo mới người dùng
                customer.setCreatedDate(userService.getCurrentDateTime());
                userService.saveUser(customer);
                booking.setCustomer(customer); // Đảm bảo set lại khách hàng mới vào booking
            }
        } else {
            // Xử lý khi thông tin khách hàng không đầy đủ
            bindingResult.rejectValue("customer.email", "error.booking", "Thông tin khách hàng không đầy đủ");
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        }

        // Kiểm tra và gán nhân viên
        if (booking.getStaff() == null || booking.getStaff().getId() == null) {
            // Xử lý khi không chọn nhân viên
            bindingResult.rejectValue("staff.id", "error.booking", "Không được bỏ trống nhân viên.");
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        } else {
            // Đảm bảo rằng staff đã được tải từ DB
            Staff staff = staffService.getStaffById(booking.getStaff().getId());
            if (staff != null) {
                booking.setStaff(staff);
            } else {
                bindingResult.rejectValue("staff.id", "error.booking", "Nhân viên không tồn tại.");
                prepareModelAttributes(model);
                return "admin/dashboard/booking_management";
            }
        }

        bookingService.save(booking);
        return "redirect:/admin/booking_management";
    }

    @PostMapping("/admin/booking_management/cancel")
    public String cancelBooking(@ModelAttribute("cancelBooking") Booking booking) {
        Booking existingBooking = bookingService.findById(booking.getId());
        if (existingBooking != null) {
            existingBooking.setStatus(Booking.Status.DaHuy);
            bookingService.save(existingBooking);
        }
        return "redirect:/admin/booking_management";
    }

    private void prepareModelAttributes(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        model.addAttribute("cancelBooking", new Booking());
        model.addAttribute("servicesList", bookingService.getAllServices());
        model.addAttribute("staffList", staffService.getAllStaff());

        // Tạo danh sách các giờ hẹn từ 8:00 đến 21:00 cách nhau 30 phút
        List<String> appointmentTimes = new ArrayList<>();
        LocalTime start = LocalTime.of(8, 0);
        LocalTime end = LocalTime.of(21, 0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        while (!start.isAfter(end)) {
            appointmentTimes.add(start.format(formatter));
            start = start.plusMinutes(30);
        }
        model.addAttribute("appointmentTimes", appointmentTimes);
    }
}
