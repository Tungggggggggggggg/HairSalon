package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.StaffSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface StaffSalaryRepository extends JpaRepository<StaffSalary, Long> {

    List<StaffSalary> findAll();

    List<StaffSalary> findByStaffId(Long staffId);

    List<StaffSalary> findByMonthAndYear(Integer month, Integer year);

    @Query("SELECT s FROM StaffSalary s WHERE s.month = :month AND s.year = :year AND s.staff.id = :staffId")
    List<StaffSalary> findByMonthAndYearAndStaffId(@Param("month") Integer month, 
                                                  @Param("year") Integer year, 
                                                  @Param("staffId") Long staffId);
}
