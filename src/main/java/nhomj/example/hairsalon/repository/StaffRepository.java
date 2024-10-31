package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.model.UserStaffDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long> {
    List<Staff> findAll();

//    Staff findOne(Long id);

    @Query("SELECT new nhomj.example.hairsalon.model.UserStaffDTO(u.id, u.name, u.email,u.password, u.phone, u.address, u.gender,u.birthday, s.experience, s.specialty, s.status,u.role, u.createdDate) FROM User u JOIN u.staff s WHERE u.role != 'NGUOIDUNG'")
    List<UserStaffDTO> findAllUserStaffs();

    Optional<Staff> findByUser(User user);
    // Sử dụng mối quan hệ trực tiếp nếu có




}
