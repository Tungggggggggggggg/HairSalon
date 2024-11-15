package nhomj.example.hairsalon.controller.user;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
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
    public String showBookingPage(@RequestParam(value = "serviceId", required = false) Long serviceId, Model model) {
        List<Service> services = serviceShopService.getAllServiceShops();
        List<Staff> staffList = staffService.getAllStaff();
    
        Booking booking = new Booking();
        booking.setCustomer(new User()); // Khởi tạo customer
        if (serviceId != null) {
            Service selectedService = serviceShopService.getServiceById(serviceId);
            if (selectedService != null) {
                booking.getServices().add(selectedService);
            }
        }
    
        model.addAttribute("booking", booking);
        model.addAttribute("services", services);
        model.addAttribute("staffList", staffList);
    
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
            List<Staff> staffList = staffService.getAllStaff();
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
            List<Staff> staffList = staffService.getAllStaff();
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        }

        // Kiểm tra và gán nhân viên
        if (booking.getStaff() == null || booking.getStaff().getId() == null) {
            bindingResult.rejectValue("staff.id", "error.booking", "Không được bỏ trống nhân viên.");
            logger.error("Không được bỏ trống nhân viên.");
            List<Service> services = serviceShopService.getAllServiceShops();
            List<Staff> staffList = staffService.getAllStaff();
            model.addAttribute("services", services);
            model.addAttribute("staffList", staffList);
            return "user/booking";
        } else {
            // Đảm bảo rằng staff đã được tải từ DB
            Staff staff = staffService.getStaffById(booking.getStaff().getId());
            if (staff != null) {
                booking.setStaff(staff);
                logger.info("Đã gán nhân viên: {}", staff.getName());
            } else {
                bindingResult.rejectValue("staff.id", "error.booking", "Nhân viên không tồn tại.");
                logger.error("Nhân viên không tồn tại với ID: {}", booking.getStaff().getId());
                List<Service> services = serviceShopService.getAllServiceShops();
                List<Staff> staffList = staffService.getAllStaff();
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
}
