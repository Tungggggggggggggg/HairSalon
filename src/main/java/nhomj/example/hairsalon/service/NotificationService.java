package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.FeedbackList;
import nhomj.example.hairsalon.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService {
    public NotificationRepository notificationRepository;

    @Autowired
    public NotificationService(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    public long countNotifications()
    {
        return notificationRepository.count();
    }
    public List<FeedbackList> getAllNotifications() {
        return notificationRepository.findAll();
    }

    public FeedbackList saveNotification(FeedbackList notification) {
        return notificationRepository.save(notification);
    }

    public FeedbackList getNotificationById(long id) {
        return this.notificationRepository.findById(id);
    }

    public void deleteNotification(long id) {
        this.notificationRepository.deleteById(id);
    }
}
