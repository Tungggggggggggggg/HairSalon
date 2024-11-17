package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Đại diện cho người dùng trong hệ thống.
 */
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String name;

    @Column(unique = true, nullable = false, columnDefinition = "VARCHAR(255)")
    private String email;

    @Column(nullable = false, columnDefinition = "VARCHAR(20)")
    private String phone;

    @Column(columnDefinition = "NVARCHAR(255)")
    private String address;

    @Column(nullable = false, columnDefinition = "DATE")
    private LocalDate birthday;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, columnDefinition = "NVARCHAR(10)")
    private Gender gender;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Booking> bookingCustomers;

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime createdDate;

    /**
     * Constructor mặc định.
     */
    public User() {
        super();
    }

    // =====================
    // Getters và Setters
    // =====================

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
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public LocalDate getBirthday() {
        return birthday;
    }
    
    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }
    
    public Gender getGender() {
        return gender;
    }
    
    public void setGender(Gender gender) {
        this.gender = gender;
    }
    
    public List<Booking> getBookingCustomers() {
        return bookingCustomers;
    }
    
    public void setBookingCustomers(List<Booking> bookingCustomers) {
        this.bookingCustomers = bookingCustomers;
    }
    
    public LocalDateTime getCreatedDate() {
        return createdDate;
    }
    
    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    // =====================
    // Phương thức bổ sung
    // =====================

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
     * Enum đại diện cho giới tính của người dùng.
     */
    public enum Gender {
        Nam, Nu
    }

}
