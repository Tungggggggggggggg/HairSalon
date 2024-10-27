package nhomj.example.hairsalon.model;

import jakarta.persistence.*;

import java.util.List;

@Entity

public class Service {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    private String shortDescription;

    private float price;

    private Integer durationMinutes;

    @OneToMany(mappedBy = "service")
    private List<Booking> bookings;

    @OneToMany(mappedBy = "service")
    private List<Revenue> revenues;
}
