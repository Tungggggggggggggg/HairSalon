package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Booking;
// Đảm bảo sử dụng tên đầy đủ cho lớp Service để tránh xung đột
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.BookingRepository;
import nhomj.example.hairsalon.repository.ServiceRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@org.springframework.stereotype.Service
public class BookingService {
    private final BookingRepository bookingRepository;
    private final ServiceRepository serviceRepository;

    public BookingService(BookingRepository bookingRepository, ServiceRepository serviceRepository) {
        this.bookingRepository = bookingRepository;
        this.serviceRepository = serviceRepository;
    }

    public long countBooking() {
        return bookingRepository.count();
    }

    // Lấy danh sách tất cả các booking, sắp xếp mới nhất lên đầu
    public List<Booking> getAllBookings() {
        return bookingRepository.findAllByOrderByCreatedDateDesc();
    }

    // Lấy danh sách tất cả các booking, sắp xếp từ cũ đến mới
    public List<Booking> getAllBookingsSortedByCreatedDateAsc() {
        return bookingRepository.findAllByOrderByCreatedDateAsc();
    }

    public Booking save(Booking booking) {
        Booking newBooking = bookingRepository.save(booking);
        // Loại bỏ việc gọi updateRevenueForBooking ở đây để tránh đếm trùng
        return newBooking;
    }

    public Booking findById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }

    // Lấy danh sách tất cả các dịch vụ
    public List<Service> getAllServices() {
        return serviceRepository.findAll();
    }

    // Lấy danh sách booking theo staffId
    public List<Booking> getBookingsByStaffId(Long staffId) {
        return bookingRepository.findByStaffId(staffId);
    }

    // Kiểm tra tính khả dụng của nhân viên
    public boolean isStaffAvailable(long staffId, LocalDate date, LocalTime time, int requestedDurationMinutes, Long bookingId) {
        // Lấy các booking của nhân viên trong ngày
        List<Booking> bookings = bookingRepository.findByStaffIdAndDate(staffId, date);

        LocalTime requestedStart = time;
        LocalTime requestedEnd = requestedStart.plusMinutes(requestedDurationMinutes);

        for (Booking booking : bookings) {
            // Bỏ qua booking hiện tại khi chỉnh sửa
            if (bookingId != null && booking.getId().equals(bookingId)) {
                continue;
            }

            LocalTime bookingStart = booking.getAppointmentTime();
            int bookingDuration = booking.getTotalDurationMinutes();
            LocalTime bookingEnd = bookingStart.plusMinutes(bookingDuration);

            if (timesOverlap(bookingStart, bookingEnd, requestedStart, requestedEnd)) {
                return false; // Nhân viên không khả dụng
            }
        }
        return true; // Nhân viên khả dụng
    }

    private boolean timesOverlap(LocalTime start1, LocalTime end1, LocalTime start2, LocalTime end2) {
        return start1.isBefore(end2) && start2.isBefore(end1);
    }

    // Lấy danh sách dịch vụ theo IDs
    public List<Service> getServicesByIds(List<Long> serviceIds) {
        Iterable<Service> servicesIterable = serviceRepository.findAllById(serviceIds);
        return StreamSupport.stream(servicesIterable.spliterator(), false)
                .collect(Collectors.toList());
    }
}
