package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Revenue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RevenueRepository extends JpaRepository<Revenue, Long> {

    List<Revenue> findAll();


}
