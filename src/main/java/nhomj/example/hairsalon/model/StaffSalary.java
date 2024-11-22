package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.math.RoundingMode;

@Entity
@Table(name = "staff_salary")
public class StaffSalary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long salaryId;

    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    private Integer month;
    private Integer year;
    private BigDecimal baseSalary;
    private BigDecimal bonus;
    private BigDecimal totalSalary;

    private LocalDateTime createDate;

    @Column(name = "update_date")
    private LocalDateTime updateDate;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        DaThanhToan, ChuaThanhToan
    }

    public StaffSalary() {
        super();
    }

    // Getters và Setters

    public Long getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(Long salaryId) {
        this.salaryId = salaryId;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public BigDecimal getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(BigDecimal baseSalary) {
        this.baseSalary = baseSalary.setScale(2, RoundingMode.HALF_UP);
        updateTotalSalary();
    }

    public BigDecimal getBonus() {
        return bonus;
    }

    public void setBonus(BigDecimal bonus) {
        this.bonus = bonus.setScale(2, RoundingMode.HALF_UP);
        updateTotalSalary();
    }

    public BigDecimal getTotalSalary() {
        return totalSalary;
    }

    public void setTotalSalary(BigDecimal totalSalary) {
        this.totalSalary = totalSalary.setScale(2, RoundingMode.HALF_UP);
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    /**
     * Phương thức trả về ngày tạo đã được định dạng dưới dạng String.
     *
     * @return ngày tạo đã định dạng (dd/MM/yyyy HH:mm:ss)
     */
    public String getFormattedCreateDate() {
        if (this.createDate != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            return this.createDate.format(formatter);
        }
        return "";
    }

    private void updateTotalSalary() {
        if (this.baseSalary != null && this.bonus != null) {
            this.totalSalary = this.baseSalary.add(this.bonus).setScale(2, RoundingMode.HALF_UP);
        }
    }

    public LocalDateTime getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * Trả về ngày cập nhật đã được định dạng dưới dạng String.
     *
     * @return ngày cập nhật đã định dạng (dd/MM/yyyy HH:mm:ss)
     */
    public String getFormattedUpdateDate() {
        if (this.updateDate != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            return this.updateDate.format(formatter);
        }
        return "";
    }

    @PrePersist
    protected void onCreate() {
        this.createDate = LocalDateTime.now();
        this.updateDate = this.createDate;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updateDate = LocalDateTime.now();
    }

}
