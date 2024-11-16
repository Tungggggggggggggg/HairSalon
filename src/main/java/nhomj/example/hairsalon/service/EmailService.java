package nhomj.example.hairsalon.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.EmailDetails;
import nhomj.example.hairsalon.model.Invoice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;



@Service
public class EmailService{


    public InvoiceService invoiceService;

    @Autowired
    public EmailService(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${spring.mail.username}") private String sender;

    public String sendSimpleMail(EmailDetails details)
    {
        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();

            mailMessage.setFrom(sender);
            mailMessage.setTo(details.getRecipient());
            mailMessage.setText(details.getMsgBody());
            mailMessage.setSubject(details.getSubject());

            javaMailSender.send(mailMessage);
            return "Mail Sent Successfully...";
        }
        catch (Exception e) {
            return "Error while Sending Mail";
        }
    }
    @Async
    public void sendHtmlEmailDL(EmailDetails details , Booking booking){

        try{
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();

            mimeMessage.setFrom(sender);
            mimeMessage.setRecipients(MimeMessage.RecipientType.TO, details.getRecipient());
            mimeMessage.setSubject(details.getSubject());

            ClassLoader classLoader = getClass().getClassLoader();
            Path filePath = Paths.get(classLoader.getResource("templates/thongbaodatlich.html").toURI());

            String htmlTemplate = Files.readString(filePath);

            htmlTemplate = htmlTemplate.replace("${customer}", booking.getCustomer().getName());
            htmlTemplate = htmlTemplate.replace("${date}", booking.getDate().toString() );
            htmlTemplate = htmlTemplate.replace("${appointmentTime}", booking.getAppointmentTime().toString());
            StringBuilder services = new StringBuilder();
            for (nhomj.example.hairsalon.model.Service service : booking.getServices()) {
                services.append(service.getName()).append(", ");
            }
            if (services.length() > 0) {
                services.setLength(services.length() - 2);
            }
            htmlTemplate = htmlTemplate.replace("${service}", services.toString());
            htmlTemplate = htmlTemplate.replace("${staff}", booking.getStaff().getName());

            mimeMessage.setContent(htmlTemplate, "text/html; charset=utf-8");

            javaMailSender.send(mimeMessage);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Error while Sending Mail" + e.getMessage());
        }
    }
    @Async
    public void sendHtmlEmailTB(EmailDetails details , Booking booking){
        try{
            Invoice invoice = invoiceService.getInvoice(booking.getId());
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();

            mimeMessage.setFrom(sender);
            mimeMessage.setRecipients(MimeMessage.RecipientType.TO, details.getRecipient());
            mimeMessage.setSubject(details.getSubject());

            ClassLoader classLoader = getClass().getClassLoader();
            Path filePath = Paths.get(classLoader.getResource("templates/thongbaothanhtoan.html").toURI());

            String htmlTemplate = Files.readString(filePath);
            htmlTemplate = htmlTemplate.replace("${id}", String.valueOf(booking.getId()));
            htmlTemplate = htmlTemplate.replace("${invoiceDate}", invoice.getInvoiceDate().toString());
            htmlTemplate = htmlTemplate.replace("${totalAmount}", invoice.getTotalAmount().toString());
            htmlTemplate = htmlTemplate.replace("${paymentMethod}", invoice.getPaymentMethod().toString());
            System.out.println(htmlTemplate);
            mimeMessage.setContent(htmlTemplate, "text/html; charset=utf-8");

            javaMailSender.send(mimeMessage);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}

