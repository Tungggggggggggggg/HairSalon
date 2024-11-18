package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.FeedbackList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackListRepository extends JpaRepository<FeedbackList, Long> {

    FeedbackList save(FeedbackList feedbackList);
}
