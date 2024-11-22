package nhomj.example.hairsalon.controller.user;

import nhomj.example.hairsalon.dto.StaffDTO;
import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.ServiceShopService;
import nhomj.example.hairsalon.service.StaffService;
import nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

    /**
     * Hiển thị trang đặt lịch. Nếu có tham số serviceId, dịch vụ đó sẽ được chọn sẵn trong form.
     *
     * @param serviceId ID của dịch vụ được chọn trước (tùy chọn)
     * @param model     đối tượng Model để truyền dữ liệu đến view
     * @return trang booking.jsp
     */
    @GetMapping("/booking")
    public String showBookingPage(@RequestParam(value = "serviceId", required = false) Long serviceId,@RequestParam(value = "staffId", required = false) Long staffId, Model model) {
        List<Service> services = serviceShopService.getAllServiceShops();
        List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien); // Đã chỉnh sửa

        Booking booking = new Booking();
        booking.setCustomer(new User()); // Khởi tạo customer
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
        model.addAttribute("staffList", staffList); // Chỉ lấy nhân viên có vai trò "Nhân viên"

        return "user/booking"; // Trang booking.jsp
    }

    /**
     * Xử lý việc đặt lịch. Lưu thông tin đặt lịch vào cơ sở dữ liệu và chuyển hướng đến trang thành công.
     *
     * @param booking        đối tượng Booking chứa thông tin đặt lịch
     * @param bindingResult  kết quả binding và validation
     * @param model          đối tượng Model để truyền dữ liệu đến view nếu có lỗi
     * @return chuyển hướng đến trang thành công hoặc quay lại form đặt lịch nếu có lỗi
     */
    @PostMapping("/booking/submit")
    public String submitBooking(@ModelAttribute("booking") @Valid Booking booking, BindingResult bindingResult, Model model) {
        logger.info("Bắt đầu xử lý đặt lịch: {}", booking);

        if (bindingResult.hasErrors()) {
            // Ghi log chi tiết các lỗi
            bindingResult.getAllErrors().forEach(error -> logger.error("Binding Error: {}", error.toString()));
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien); // Đã chỉnh sửa
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        }

        // Xử lý thông tin khách hàng
        User customer = booking.getCustomer();
        if (customer != null && customer.getEmail() != null && !customer.getEmail().isEmpty()) {
            // Kiểm tra xem email có tồn tại trong DB hay không
            Optional<User> existingCustomerOpt = userService.findOneByEmail(customer.getEmail());
            if (existingCustomerOpt.isPresent()) {
                User existingCustomer = existingCustomerOpt.get();
                booking.setCustomer(existingCustomer);
                logger.info("Khách hàng đã tồn tại: {}", existingCustomer.getEmail());
            } else {
                // Nếu không tồn tại, tạo mới người dùng
                customer.setCreatedDate(userService.getCurrentDateTime());
                userService.saveUser(customer);
                booking.setCustomer(customer); // Đảm bảo set lại khách hàng mới vào booking
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

        // Kiểm tra và gán nhân viên
        if (booking.getStaff() == null || booking.getStaff().getId() == null) {
            bindingResult.rejectValue("staff.id", "error.booking", "Không được bỏ trống nhân viên.");
            logger.error("Không được bỏ trống nhân viên.");
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien); // Đã chỉnh sửa
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        } else {
            // Đảm bảo rằng staff đã được tải từ DB
            Staff staff = staffService.getStaffById(booking.getStaff().getId());
            if (staff != null && staff.getRole() == Staff.Role.NhanVien) { // Kiểm tra vai trò nhân viên
                booking.setStaff(staff);
                logger.info("Đã gán nhân viên: {}", staff.getName());
            } else {
                bindingResult.rejectValue("staff.id", "error.booking", "Nhân viên không tồn tại hoặc không hợp lệ.");
                logger.error("Nhân viên không tồn tại hoặc không hợp lệ với ID: {}", booking.getStaff().getId());
                List<Service> services = serviceShopService.getAllServiceShops();
                List<Staff> staffList = staffService.getStaffByRole(Staff.Role.NhanVien); // Đã chỉnh sửa
                model.addAttribute("services", services);
                model.addAttribute("staffList", staffList);
                return "user/booking";
            }
        }

        // Thiết lập trạng thái mặc định
        if (booking.getStatus() == null) {
            booking.setStatus(Booking.Status.DaDat);
            logger.info("Đã thiết lập trạng thái mặc định: DaDat");
        }

        // Lưu booking vào DB
        bookingService.save(booking);
        logger.info("Đã lưu Booking với ID: {}", booking.getId());

        return "redirect:/booking_success";
    }

    /**
     * Hiển thị trang thông báo đặt lịch thành công.
     *
     * @return trang booking_success.jsp
     */
    @GetMapping("/booking_success")
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
