// BookingRepository.java
package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    // Không cần khai báo lại findAll(), save(), deleteById() vì JpaRepository đã có sẵn
}
