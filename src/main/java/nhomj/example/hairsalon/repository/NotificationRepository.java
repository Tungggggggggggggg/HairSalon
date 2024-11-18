package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.FeedbackList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface NotificationRepository extends JpaRepository<FeedbackList, Long> {
    List<FeedbackList> findAll();

    FeedbackList findById(long id);

    FeedbackList save(FeedbackList notification);

    void deleteById(long id);
}
