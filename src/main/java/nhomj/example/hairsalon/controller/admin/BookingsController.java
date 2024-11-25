package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.*;
import nhomj.example.hairsalon.util.BookingExcelExporter;
import nhomj.example.hairsalon.dto.StaffDTO;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.EmailService;
import nhomj.example.hairsalon.service.RevenueService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

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
        model.addAttribute("completeBooking", new Booking());
        model.addAttribute("servicesList", bookingService.getAllServices());
        model.addAttribute("staffList", staffService.getStaffByRole(Staff.Role.NhanVien));

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

        if (bindingResult.hasErrors()) {
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        }

        if (booking.getStatus() == null) {
            booking.setStatus(Booking.Status.DaDat);
        }
        if (booking.getServices() == null) {
            booking.setServices(new ArrayList<>());
        }

        User customer = booking.getCustomer();
        if (customer != null && customer.getEmail() != null && !customer.getEmail().isEmpty()) {
            Optional<User> existingCustomerOpt = userService.findOneByEmail(customer.getEmail());
            if (existingCustomerOpt.isPresent()) {
                User existingCustomer = existingCustomerOpt.get();
                booking.setCustomer(existingCustomer);
            } else {
                customer.setCreatedDate(userService.getCurrentDateTime());
                userService.saveUser(customer);
                booking.setCustomer(customer);
            }
        } else {
            bindingResult.rejectValue("customer.email", "error.booking", "Thông tin khách hàng không đầy đủ");
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        }

        if (booking.getStaff() == null || booking.getStaff().getId() == null) {
            bindingResult.rejectValue("staff.id", "error.booking", "Không được bỏ trống nhân viên.");
            prepareModelAttributes(model);
            return "admin/dashboard/booking_management";
        } else {
            Staff staff = staffService.getStaffById(booking.getStaff().getId());
            if (staff != null) {
                booking.setStaff(staff);
            } else {
                bindingResult.rejectValue("staff.id", "error.booking", "Nhân viên không tồn tại.");
                prepareModelAttributes(model);
                return "admin/dashboard/booking_management";
            }
        }

        bookingService.saveNew(booking);
        return "redirect:/admin/booking_management";
    }

    @PostMapping("/admin/booking_management/cancel")
    public String cancelBooking(@ModelAttribute("cancelBooking") Booking booking) {
        Booking existingBooking = bookingService.findById(booking.getId());
        if (existingBooking != null) {
            existingBooking.setStatus(Booking.Status.DaHuy);
            bookingService.saveCancel(existingBooking);
        }
        return "redirect:/admin/booking_management";
    }

    @PostMapping("/admin/booking_management/complete")
    public String completeBooking(@ModelAttribute("completeBooking") Booking booking , @RequestParam("payMethod") String payMethod  ) {
        Booking existingBooking = bookingService.findById(booking.getId());
        Invoice.PaymentMethod paymentMethod = Invoice.PaymentMethod.valueOf(payMethod);
        Invoice invoice = new Invoice(Invoice.PaymentStatus.DaThanhToan ,paymentMethod, LocalDate.now());
        if (existingBooking != null) {
            existingBooking.setStatus(Booking.Status.HoanThanh);
            bookingService.saveComplete(existingBooking, invoice);
        }
        return "redirect:/admin/booking_management";
    }

    private void prepareModelAttributes(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        model.addAttribute("cancelBooking", new Booking());
        model.addAttribute("completeBooking", new Booking());
        model.addAttribute("servicesList", bookingService.getAllServices());
        model.addAttribute("staffList", staffService.getStaffByRole(Staff.Role.NhanVien));

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

    @GetMapping("/admin/booking_management/available_staff")
    @ResponseBody
    public List<StaffDTO> getAvailableStaff(
            @RequestParam("date") String dateStr,
            @RequestParam("time") String timeStr,
            @RequestParam(value = "bookingId", required = false) Long bookingId,
            @RequestParam(value = "services", required = false) List<Long> serviceIds) {

        LocalDate date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        LocalTime time = LocalTime.parse(timeStr, DateTimeFormatter.ofPattern("HH:mm"));

        int requestedDurationMinutes = 30; // Thời lượng mặc định
        if (serviceIds != null && !serviceIds.isEmpty()) {

            List<Service> services = bookingService.getServicesByIds(serviceIds);
            requestedDurationMinutes = services.stream()
                    .mapToInt(Service::getDurationMinutes)
                    .sum();
        }

        List<Staff> availableStaff = staffService.getAvailableStaff(date, time, requestedDurationMinutes, bookingId);

        List<StaffDTO> staffDTOs = availableStaff.stream()
                .map(staff -> new StaffDTO(staff.getId(), staff.getName(), staff.getAvatar()))
                .collect(Collectors.toList());

        return staffDTOs;
    }

    @GetMapping("/admin/booking_management/export")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=bookings.xlsx";
        response.setHeader(headerKey, headerValue);

        List<Booking> bookings = bookingService.getAllBookingsSortedByCreatedDateAsc();

        BookingExcelExporter excelExporter = new BookingExcelExporter(bookings);

        excelExporter.export(response);
    }
}
