package nhomj.example.hairsalon.model;


import jakarta.persistence.*;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Entity
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private User customer;

    @ManyToOne
    @JoinColumn(name = "staff_id", nullable = false)
    private Staff staff;

    @ManyToOne
    @JoinColumn(name = "service_id", nullable = false)
    private Service service;

    @OneToMany(mappedBy = "booking")
    private List<Revenue> revenues;

    @Temporal(TemporalType.DATE)
    private LocalDate bookingDate;
    @Temporal(TemporalType.TIME)
    private LocalTime bookingTime;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createDateTime;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        PENDING, CONFIRMED, COMPLETED, CANCELED
    }

}

