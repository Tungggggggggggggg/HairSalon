package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.EmailDetails;
import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.repository.FeedbackListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackListService {

    FeedbackListRepository feedbackListRepository;
    EmailService emailService;
    @Autowired
    public FeedbackListService(FeedbackListRepository feedbackListRepository
    , EmailService emailService) {
        this.feedbackListRepository = feedbackListRepository;
        this.emailService = emailService;
    }

    public FeedbackList save(FeedbackList feedbackList) {
        FeedbackList feedbackList1 =  feedbackListRepository.save(feedbackList);
        if(feedbackList1 != null) {
            emailService.sendHtmlEmailFeedback(new EmailDetails(feedbackList1.getEmail(), "Thông báo phản hồi"), feedbackList1);
        }
        return feedbackList1;
    }

    public List<FeedbackList> getAllFeedbackList() {
        return feedbackListRepository.findAll();
    }

    public void deleteFeedbackList(FeedbackList feedbackList) {
        feedbackListRepository.delete(feedbackList);
    }

    public long numberOfFeedbackList() {
        return feedbackListRepository.count();
    }

}
