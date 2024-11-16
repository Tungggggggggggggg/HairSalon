package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "booking")
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
    @JoinColumn(name = "staff_shift_id")
    private StaffShift staffShift;

    @ManyToMany
    @JoinTable(
            name = "booking_service",
            joinColumns = @JoinColumn(name = "booking_id"),
            inverseJoinColumns = @JoinColumn(name = "service_id")
    )
    private List<Service> services = new ArrayList<>();

    @NotNull(message = "Ngày hẹn không được để trống")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(nullable = false, columnDefinition = "DATE")
    private LocalDate date;

    @NotNull(message = "Giờ hẹn không được để trống")
    @DateTimeFormat(pattern = "HH:mm")
    @Column(nullable = false, columnDefinition = "TIME")
    private LocalTime appointmentTime;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, columnDefinition = "NVARCHAR(20)")
    private Status status = Status.DaDat;

    public enum Status {
        DaDat,
        HoanThanh,
        DaHuy
    }

    // Getters và Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public StaffShift getStaffShift() {
        return staffShift;
    }

    public void setStaffShift(StaffShift staffShift) {
        this.staffShift = staffShift;
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(LocalTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    // Phương thức trả về ngày đã định dạng
    public String getFormattedDate() {
        if (this.date != null) {
            return this.date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        }
        return "";
    }

    // Phương thức trả về giờ đã định dạng
    public String getFormattedAppointmentTime() {
        if (this.appointmentTime != null) {
            return this.appointmentTime.format(DateTimeFormatter.ofPattern("HH:mm"));
        }
        return "";
    }

    // Phương thức trả về tên hiển thị của trạng thái
    public String getStatusDisplayName() {
        switch (this.status) {
            case DaDat:
                return "Đã Đặt";
            case HoanThanh:
                return "Hoàn Thành";
            case DaHuy:
                return "Đã Hủy";
            default:
                return "";
        }
    }
}
