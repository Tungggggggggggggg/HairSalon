package nhomj.example.hairsalon.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private String message;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime notificationDate;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        UNREAD, READ
    }

}
