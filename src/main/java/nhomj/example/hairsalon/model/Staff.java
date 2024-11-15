package nhomj.example.hairsalon.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "staff")
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String avatar;
    private String name;
    private String email;
    private String phone;
    private String address;
    @Enumerated(EnumType.STRING)
    private GenderStaff gender;
    private LocalDate birthday;
    private String password;
    private String experience;
    @Enumerated(EnumType.STRING)
    private Role role = Role.NhanVien;
    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<StaffSalary> salaries;

    @OneToMany(mappedBy = "staff" ,cascade = CascadeType.ALL)
    private List<StaffShift> shifts;

    @OneToMany(mappedBy = "staff")
    private List<Notification> notifications;
    // Getters and Setters

    public enum GenderStaff {
        Nam, Nu
    }

    public GenderStaff getGender() {
        return gender;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public void setGender(GenderStaff gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
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

    public List<StaffShift> getShifts() {
        return shifts;
    }

    public void setShifts(List<StaffShift> shifts) {
        this.shifts = shifts;
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }

    public enum Role {
        NhanVien, Admin
    }


}
