package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.repository.FeedbackListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedbackListService {

    FeedbackListRepository feedbackListRepository;
    @Autowired
    public FeedbackListService(FeedbackListRepository feedbackListRepository) {
        this.feedbackListRepository = feedbackListRepository;
    }

    public FeedbackList save(FeedbackList feedbackList) {
        return feedbackListRepository.save(feedbackList);
    }
}
