package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "revenue")
public class Revenue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer summaryId;

    @Column(name = "summary_date", nullable = false)
    private LocalDate summaryDate;

    @Column(name = "total_revenue", nullable = false, precision = 15, scale = 2, columnDefinition = "DECIMAL(15, 2)")
    private BigDecimal totalRevenue;

    @Column(name = "number_of_bookings", nullable = false)
    private Integer numberOfBookings;

    @Column(name = "total_services", nullable = false)
    private Integer totalServices;

    // Các getter và setter hiện tại...

    public Integer getSummaryId() {
        return summaryId;
    }

    public void setSummaryId(Integer summaryId) {
        this.summaryId = summaryId;
    }

    public LocalDate getSummaryDate() {
        return summaryDate;
    }

    public void setSummaryDate(LocalDate summaryDate) {
        this.summaryDate = summaryDate;
    }

    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public Integer getNumberOfBookings() {
        return numberOfBookings;
    }

    public void setNumberOfBookings(Integer numberOfBookings) {
        this.numberOfBookings = numberOfBookings;
    }

    public Integer getTotalServices() {
        return totalServices;
    }

    public void setTotalServices(Integer totalServices) {
        this.totalServices = totalServices;
    }

    // Thêm phương thức định dạng ngày
    public String getFormattedSummaryDate() {
        if (summaryDate != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            return summaryDate.format(formatter);
        }
        return "";
    }
}
