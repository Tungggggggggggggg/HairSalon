package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import org.eclipse.tags.shaded.org.apache.regexp.RE;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(unique = true, nullable = false)
    private String email;

    private String password;

    private String phone;

    private String address;

    private String gender;

    @Temporal(TemporalType.DATE)
    private LocalDate birthday;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL )
    private Staff staff;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @OneToMany(mappedBy = "customer")
    private List<Booking> bookingCustomers;

    @OneToMany(mappedBy = "customer")
    private List<Revenue> revenueCustomers;

    @OneToMany(mappedBy = "user")
    private List<Notification> notificationCustomers;

    @Enumerated(EnumType.STRING)
    private Role role;

    public User() {
        super();
    }

    public User(Long id, String name, String email, String password, String phone, String address, String gender, LocalDate birthday, LocalDateTime createdDate, List<Booking> bookingCustomers, List<Revenue> revenueCustomers, Role role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.birthday = birthday;
        this.createdDate = createdDate;
        this.bookingCustomers = bookingCustomers;
        this.revenueCustomers = revenueCustomers;
        this.role = role;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public List<Booking> getBookingCustomers() {
        return bookingCustomers;
    }

    public void setBookingCustomers(List<Booking> bookingCustomers) {
        this.bookingCustomers = bookingCustomers;
    }

    public List<Revenue> getRevenueCustomers() {
        return revenueCustomers;
    }

    public void setRevenueCustomers(List<Revenue> revenueCustomers) {
        this.revenueCustomers = revenueCustomers;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public enum Role {
        NGUOIDUNG, NHANVIEN, ADMIN
    }



}
