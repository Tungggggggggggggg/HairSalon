package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Revenue;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
@Repository
public interface RevenueRepository extends JpaRepository<Revenue, Long> {

    List<Revenue> findAll( Sort sort);

    @Query("SELECT r FROM Revenue r WHERE r.summaryDate BETWEEN :startDate AND :endDate")
    List<Revenue> findAllDate(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query("SELECT r.totalRevenue FROM Revenue r WHERE r.summaryDate BETWEEN :startDate AND CURRENT_DATE")
    List<BigDecimal> findByDateRange(@Param("startDate") LocalDate startDate);

    @Query("SELECT r.totalRevenue FROM Revenue r WHERE r.summaryDate BETWEEN " +
            "CAST(CONCAT(FUNCTION('YEAR', CURRENT_DATE), '-', FUNCTION('MONTH', CURRENT_DATE), '-01') AS date) " +
            "AND CURRENT_DATE")
    List<BigDecimal> findAllInCurrentMonth();

    @Query("SELECT r.totalRevenue FROM Revenue r WHERE FUNCTION('YEAR', r.summaryDate) = FUNCTION('YEAR', CURRENT_DATE)")
    List<BigDecimal> findAllInCurrentYear();

    Revenue findOneBySummaryDate(@Param("summaryDate") LocalDate summaryDate);
}
