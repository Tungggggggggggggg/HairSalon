package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.EmailDetails;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.BookingRepository;
import nhomj.example.hairsalon.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class BookingService {
    private final BookingRepository bookingRepository;
    private final ServiceRepository serviceRepository;
    private final EmailService emailService;

    @Autowired
    public BookingService(BookingRepository bookingRepository, ServiceRepository serviceRepository, EmailService emailService) {
        this.bookingRepository = bookingRepository;
        this.serviceRepository = serviceRepository;
        this.emailService = emailService;
    }
    public long countBooking() {
        return bookingRepository.count();
    }
    // Lấy danh sách tất cả các booking
    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }
    // Lưu hoặc cập nhật một booking
    public Booking save(Booking booking) {
        Booking newBooking = bookingRepository.save(booking);
        if (newBooking != null) {
            emailService.sendHtmlEmailDL(new EmailDetails(newBooking.getCustomer().getEmail(), "Chào mừng " + newBooking.getCustomer().getName().toString()+ "Cảm ơn bạn đã đăng ký tài khoản với chúng tôi!"), newBooking);
        }
        return newBooking;
    }
    public Booking findById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }
    // Lấy danh sách tất cả các dịch vụ
    public List<Service> getAllServices() {
        return serviceRepository.findAll();
    }
}