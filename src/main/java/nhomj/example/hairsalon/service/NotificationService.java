package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Notification;
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

    public List<Notification> getAllNotifications() {
        return notificationRepository.findAll();
    }

    public Notification saveNotification(Notification notification) {
        return notificationRepository.save(notification);
    }

    public Notification getNotificationById(long id) {
        return this.notificationRepository.findById(id);
    }

    public void deleteNotification(long id) {
        this.notificationRepository.deleteById(id);
    }
}
