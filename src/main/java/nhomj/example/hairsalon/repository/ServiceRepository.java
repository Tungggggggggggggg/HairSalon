package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {
    List<Service> findAllByOrderByIdDesc();
}
