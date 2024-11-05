package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long> {
    List<Staff> findAll();

    Staff findById(long id);

}
