package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {
    // Không cần khai báo lại findAll(), save(), findById() vì JpaRepository đã có sẵn
}
