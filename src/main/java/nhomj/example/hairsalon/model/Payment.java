package nhomj.example.hairsalon.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;

    private float amount;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime paymentDate;

    @Enumerated(EnumType.STRING)
    private Status status;

    private String method;

    // Getters and Setters
    // Enum Status (Paid, Unpaid)
    public enum Status {
        PAID, UNPAID
    }
}
