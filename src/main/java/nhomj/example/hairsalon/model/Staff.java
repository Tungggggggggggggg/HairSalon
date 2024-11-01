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

    private String experience;
    private String specialty;

    @Enumerated(EnumType.STRING)
    private Status status;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<StaffSalary> salaries;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }

    public List<StaffSalary> getSalaries() {
        return salaries;
    }

    public void setSalaries(List<StaffSalary> salaries) {
        this.salaries = salaries;
    }


    // Getters and Setters
    // Enum Status (Available, Unavailable)
    public enum Status {
        TRONG, COLICH
        //TRỐNG VÀ CÓ LỊCH
    }
}