package nhomj.example.hairsalon.model;

import jakarta.persistence.*;

import java.util.List;

//staff ở đây là chỉ cho stylist
@Entity
@Table(name = "staff")
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String name;
    private String experience;
    private String specialty;

    @Enumerated(EnumType.STRING)
    private Status status;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<StaffSalary> salaries;


    // Getters and Setters
    // Enum Status (Available, Unavailable)
    public enum Status {
        AVAILABLE, UNAVAILABLE
    }
}
