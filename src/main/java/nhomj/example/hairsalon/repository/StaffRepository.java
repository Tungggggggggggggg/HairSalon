package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long> {

    List<Staff> findAll();

    Staff findById(long id);

    Staff findStaffByEmail(String email);
    
    // Thêm phương thức để tìm nhân viên theo vai trò
    List<Staff> findByRole(Staff.Role role);

    List<Staff> findAllByOrderByCreatedDateDesc(); // Thêm phương thức này
}
