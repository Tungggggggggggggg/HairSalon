package nhomj.example.hairsalon.controller;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.EmailDetails;
import nhomj.example.hairsalon.service.BookingService;
import nhomj.example.hairsalon.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class EmailController {

    public EmailService emailService;
    public BookingService bookingService;
    @Autowired
    public EmailController(EmailService emailService, BookingService bookingService) {
        this.emailService = emailService;
        this.bookingService = bookingService;
    }


    @GetMapping("/sendMail")
    public String sendMail(@RequestParam long id)
    {
        Booking booking = bookingService.findById(id);
        System.out.println(booking.getCustomer().getEmail());
        EmailDetails details = new EmailDetails(booking.getCustomer().getEmail(), "thông báo thành công");
        emailService.sendHtmlEmailDL(details, booking);
        return "thành công";
    }

    String msgBody = "Quý khách hàng : ";
}
