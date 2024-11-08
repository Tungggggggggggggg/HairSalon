package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.BookingRepository;
import nhomj.example.hairsalon.repository.ServiceRepository;
import java.util.List;

@org.springframework.stereotype.Service
public class BookingService {


    private final BookingRepository bookingRepository;
    private final ServiceRepository serviceRepository;

    public BookingService(BookingRepository bookingRepository, ServiceRepository serviceRepository) {
        this.bookingRepository = bookingRepository;
        this.serviceRepository = serviceRepository;
    }

    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    public List<Service> getAllServices() {
        return serviceRepository.findAll();
    }

    public void saveBooking(Booking booking) {
        bookingRepository.save(booking);
    }
}
