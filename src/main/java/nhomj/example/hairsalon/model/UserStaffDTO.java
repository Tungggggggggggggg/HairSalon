package nhomj.example.hairsalon.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class UserStaffDTO {
    private Long id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String gender;
    private LocalDate birthday;
    private String experience;
    private String specialty;
    private Staff.Status status;
    private User.Role role;
    private LocalDateTime createdDate;


    // Constructor với các tham số theo đúng thứ tự
    public UserStaffDTO(Long id, String name, String email ,  String password, String phone, String address, String gender,
                        LocalDate birthday, String experience, String specialty, Staff.Status status,
                        User.Role role, LocalDateTime createdDate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.birthday = birthday;
        this.experience = experience;
        this.specialty = specialty;
        this.status = status;
        this.role = role;
        this.createdDate = createdDate;
    }

    public UserStaffDTO() {
        super();
    }

    // Các getter và setter khác

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

    public Staff.Status getStatus() {
        return status;
    }

    public void setStatus(Staff.Status status) {
        this.status = status;
    }

    public User.Role getRole() {
        return role;
    }

    public void setRole(User.Role role) {
        this.role = role;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
}

