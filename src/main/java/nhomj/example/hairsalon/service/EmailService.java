package nhomj.example.hairsalon.service;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.EmailDetails;
import nhomj.example.hairsalon.model.FeedbackList;
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
    String displayName = "JSalon";

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

            mimeMessage.setFrom(new InternetAddress(sender, displayName));
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
    public void sendHtmlEmailTT(EmailDetails details , Booking booking){
        try{
            Invoice invoice = invoiceService.getInvoice(booking.getId());
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();

            mimeMessage.setFrom(new InternetAddress(sender, displayName));
            mimeMessage.setRecipients(MimeMessage.RecipientType.TO, details.getRecipient());
            mimeMessage.setSubject(details.getSubject());

            ClassLoader classLoader = getClass().getClassLoader();
            Path filePath = Paths.get(classLoader.getResource("templates/thongbaothanhtoan.html").toURI());

            String htmlTemplate = Files.readString(filePath);
            htmlTemplate = htmlTemplate.replace("${id}", Long.toString(invoice.getId()));
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

    @Async
    public void sendHtmlEmailFeedback(EmailDetails details , FeedbackList feedbackList){
        try{
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();

            mimeMessage.setFrom(new InternetAddress(sender, displayName));
            mimeMessage.setRecipients(MimeMessage.RecipientType.TO, details.getRecipient());
            mimeMessage.setSubject(details.getSubject());

            ClassLoader classLoader = getClass().getClassLoader();
            Path filePath = Paths.get(classLoader.getResource("templates/thongbaophanhoi.html").toURI());

            String htmlTemplate = Files.readString(filePath);
            htmlTemplate = htmlTemplate.replace("userName", feedbackList.getUserName());
            htmlTemplate = htmlTemplate.replace("feedbackDate", feedbackList.getFeedBackDate().toString());
            htmlTemplate = htmlTemplate.replace("feedbackType", feedbackList.getFeedbackType().toString());
            htmlTemplate = htmlTemplate.replace("message", feedbackList.getMessage() );
            System.out.println(htmlTemplate);
            mimeMessage.setContent(htmlTemplate, "text/html; charset=utf-8");

            javaMailSender.send(mimeMessage);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Async
    public void sendHtmlEmailCancel(EmailDetails details , Booking booking){
        try{
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();

            mimeMessage.setFrom(new InternetAddress(sender, displayName));
            mimeMessage.setRecipients(MimeMessage.RecipientType.TO, details.getRecipient());
            mimeMessage.setSubject(details.getSubject());

            ClassLoader classLoader = getClass().getClassLoader();
            Path filePath = Paths.get(classLoader.getResource("templates/thongbaohuy.html").toURI());

            String htmlTemplate = Files.readString(filePath);
            htmlTemplate = htmlTemplate.replace("bookingId", booking.getId().toString());
            htmlTemplate = htmlTemplate.replace("cancelDate", booking.getDate().toString());
            htmlTemplate = htmlTemplate.replace("serviceName", booking.getServices().get(0).getName());

            System.out.println(htmlTemplate);
            mimeMessage.setContent(htmlTemplate, "text/html; charset=utf-8");

            javaMailSender.send(mimeMessage);
        }catch (Exception e){
            e.printStackTrace();
        }
    }



}

