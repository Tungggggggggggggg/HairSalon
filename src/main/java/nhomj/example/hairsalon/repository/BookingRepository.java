package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByStaffId(Long staffId);

    List<Booking> findByStaffIdAndDate(Long staffId, LocalDate date);
}
