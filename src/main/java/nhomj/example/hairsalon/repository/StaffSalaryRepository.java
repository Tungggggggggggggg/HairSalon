package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.StaffSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffSalaryRepository extends JpaRepository<StaffSalary, Long> {

    List<StaffSalary> findAll();
    List<StaffSalary> findByStaffId(Long staffId);
    List<StaffSalary> findByMonthAndYear(Integer month, Integer year);
}
