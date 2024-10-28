package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findAll();

    Notification findById(long id);

    Notification save(Notification notification);

    void deleteById(long id);
}
