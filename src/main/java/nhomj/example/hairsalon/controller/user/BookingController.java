package nhomj.example.hairsalon.controller.user;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.validation.Valid;
import nhomj.example.hairsalon.dto.StaffDTO;
import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.ServiceShopService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;

@Controller
@RequestMapping("/home")
public class BookingController {

    private static final Logger logger = LoggerFactory.getLogger(BookingController.class);

    private final BookingService bookingService;
    private final ServiceShopService serviceShopService;
    private final StaffService staffService;
    private final UserService userService;

    @Autowired
    public BookingController(BookingService bookingService, ServiceShopService serviceShopService,
                             StaffService staffService, UserService userService) {
        this.bookingService = bookingService;
        this.serviceShopService = serviceShopService;
        this.staffService = staffService;
        this.userService = userService;
    }

    @GetMapping("/booking")
    public String showBookingPage(@RequestParam(value = "serviceId", required = false) Long serviceId,@RequestParam(value = "staffId", required = false) Long staffId, Model model) {
        List<Service> services = serviceShopService.getAllServiceShops();
        List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien);

        Booking booking = new Booking();
        booking.setCustomer(new User());
        if (serviceId != null) {
            Service selectedService = serviceShopService.getServiceById(serviceId);
            if (selectedService != null) {
                booking.getServices().add(selectedService);
            }
        }
        if (staffId != null) {
            Staff selectedStaff = staffService.getStaffById(staffId);
            if (selectedStaff != null) {
                booking.setStaff(selectedStaff);
            }
        }

        model.addAttribute("booking", booking);
        model.addAttribute("services", services);
        model.addAttribute("staffList", staffList);

        return "user/booking";
    }

    @PostMapping("/booking/submit")
    public String submitBooking(@ModelAttribute("booking") @Valid Booking booking, BindingResult bindingResult, Model model) {
        logger.info("Bắt đầu xử lý đặt lịch: {}", booking);

        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> logger.error("Binding Error: {}", error.toString()));
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien);
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        }

        User customer = booking.getCustomer();
        if (customer != null && customer.getEmail() != null && !customer.getEmail().isEmpty()) {
            Optional<User> existingCustomerOpt = userService.findOneByEmail(customer.getEmail());
            if (existingCustomerOpt.isPresent()) {
                User existingCustomer = existingCustomerOpt.get();
                booking.setCustomer(existingCustomer);
                logger.info("Khách hàng đã tồn tại: {}", existingCustomer.getEmail());
            } else {
                customer.setCreatedDate(userService.getCurrentDateTime());
                userService.saveUser(customer);
                booking.setCustomer(customer);
                logger.info("Đã tạo mới khách hàng: {}", customer.getEmail());
            }
        } else {
            bindingResult.rejectValue("customer.email", "error.booking", "Thông tin khách hàng không đầy đủ");
            logger.error("Thông tin khách hàng không đầy đủ.");
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien); // Đã chỉnh sửa
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        }

        if (booking.getStaff() == null || booking.getStaff().getId() == null) {
            bindingResult.rejectValue("staff.id", "error.booking", "Không được bỏ trống nhân viên.");
            logger.error("Không được bỏ trống nhân viên.");
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien);
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        } else {
            Staff staff = staffService.getStaffById(booking.getStaff().getId());
            if (staff != null && staff.getRole() == Staff.Role.NhanVien) {
                booking.setStaff(staff);
                logger.info("Đã gán nhân viên: {}", staff.getName());
            } else {
                bindingResult.rejectValue("staff.id", "error.booking", "Nhân viên không tồn tại hoặc không hợp lệ.");
                logger.error("Nhân viên không tồn tại hoặc không hợp lệ với ID: {}", booking.getStaff().getId());
                List<Service> services = serviceShopService.getAllServiceShops();
                List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien);
                model.addAttribute("services", services);
                model.addAttribute("staffList", staffList);
                return "user/booking";
            }
        }

        if (booking.getStatus() == null) {
            booking.setStatus(Booking.Status.DaDat);
            logger.info("Đã thiết lập trạng thái mặc định: DaDat");
        }

        bookingService.saveNew(booking);
        logger.info("Đã lưu Booking với ID: {}", booking.getId());

        return "redirect:/home/booking/booking_success";
    }

    /**
     * Hiển thị trang thông báo đặt lịch thành công.
     *
     * @return trang booking_success.jsp
     */
    @GetMapping("/booking/booking_success")
    public String showBookingSuccessPage() {
        return "user/booking_success";
    }

    /**
     * API để lấy danh sách nhân viên khả dụng dựa trên ngày, giờ và dịch vụ
     */
    @GetMapping("/booking/available_staff")
    @ResponseBody
    public List<StaffDTO> getAvailableStaff(
            @RequestParam("date") String dateStr,
            @RequestParam("time") String timeStr,
            @RequestParam(value = "services", required = false) List<Long> serviceIds) {

        // Chuyển đổi định dạng ngày và giờ
        LocalDate date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        LocalTime time = LocalTime.parse(timeStr, DateTimeFormatter.ofPattern("HH:mm"));

        int requestedDurationMinutes = 30; // Thời lượng mặc định
        if (serviceIds != null && !serviceIds.isEmpty()) {
            // Tính tổng thời lượng từ các dịch vụ
            List<Service> services = bookingService.getServicesByIds(serviceIds);
            requestedDurationMinutes = services.stream()
                    .mapToInt(Service::getDurationMinutes)
                    .sum();
        }

        // Lấy danh sách nhân viên khả dụng
        List<Staff> availableStaff = staffService.getAvailableStaff(date, time, requestedDurationMinutes, null);

        // Chuyển đổi sang StaffDTO để tránh vấn đề tuần hoàn trong JSON
        List<StaffDTO> staffDTOs = availableStaff.stream()
                .map(staff -> new StaffDTO(staff.getId(), staff.getName(), staff.getAvatar()))
                .collect(Collectors.toList());

        return staffDTOs;
    }
}
