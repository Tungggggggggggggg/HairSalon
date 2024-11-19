package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name = "staff")
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "avatar", columnDefinition = "NVARCHAR(MAX)")
    private String avatar;

    @Column(name = "name", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String name;

    @Column(name = "email", nullable = false, unique = true, columnDefinition = "NVARCHAR(255)")
    private String email;

    @Column(name = "phone", columnDefinition = "NVARCHAR(50)")
    private String phone;

    @Column(name = "address", columnDefinition = "NVARCHAR(MAX)")
    private String address;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", columnDefinition = "NVARCHAR(10)")
    private GenderStaff gender;

    private LocalDate birthday;

    @Column(name = "password", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String password;

    @Column(name = "experience", columnDefinition = "NVARCHAR(MAX)")
    private String experience;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", columnDefinition = "NVARCHAR(50)")
    private Role role = Role.NhanVien;

    @Column(name = "created_date", updatable = false)
    private LocalDateTime createdDate;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<StaffSalary> salaries;

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private List<StaffShift> shifts;


    public enum GenderStaff {
        Nam, Nu
    }

    public enum Role {
        NhanVien, Admin
    }

    public Staff() {
        super();
    }

    // Getters và Setters

    public Long getId() {
        return id;
    }

	public void setId(Long id) {
		this.id = id;
	}

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public GenderStaff getGender() {
        return gender;
    }
    
    public void setGender(GenderStaff gender) {
        this.gender = gender;
    }
    
    public LocalDate getBirthday() {
        return birthday;
    }
    
    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
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
    
    public LocalDateTime getCreatedDate() {
        return createdDate;
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


    /**
     * Trả về ngày sinh đã được định dạng dưới dạng "dd/MM/yyyy".
     *
     * @return Ngày sinh dưới dạng String. Nếu birthday là null, trả về chuỗi rỗng.
     */
    public String getFormattedBirthday() {
        if (this.birthday != null) {
            return this.birthday.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        }
        return "";
    }

    /**
     * Trả về giới tính đã được định dạng.
     *
     * @return "Nam" hoặc "Nữ"
     */
    public String getFormattedGender() {
        if (this.gender != null) {
            switch (this.gender) {
                case Nam:
                    return "Nam";
                case Nu:
                    return "Nữ";
                default:
                    return "Khác";
            }
        }
        return "";
    }

    /**
     * Trả về chức vụ đã được định dạng.
     *
     * @return "Nhân viên" hoặc "Admin"
     */
    public String getFormattedRole() {
        if (this.role != null) {
            switch (this.role) {
                case NhanVien:
                    return "Nhân viên";
                case Admin:
                    return "Admin";
                default:
                    return this.role.name();
            }
        }
        return "";
    }

    /**
     * Trả về ngày tạo đã được định dạng dưới dạng "dd/MM/yyyy HH:mm:ss".
     *
     * @return Ngày tạo dưới dạng String. Nếu createdDate là null, trả về chuỗi rỗng.
     */
    public String getFormattedCreatedDate() {
        if (this.createdDate != null) {
            return this.createdDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
        }
        return "";
    }

    /**
     * Được gọi trước khi thực hiện persist để thiết lập createdDate.
     */
    @PrePersist
    protected void onCreate() {
        this.createdDate = LocalDateTime.now();
    }
}
