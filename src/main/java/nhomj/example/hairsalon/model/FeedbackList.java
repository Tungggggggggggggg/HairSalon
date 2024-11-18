package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "feedbacklist")
public class FeedbackList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "NVARCHAR(255)")
    private String userName;

    @Column(nullable = false, columnDefinition = "NVARCHAR(255)")
    private String phone;

    @Column(columnDefinition = "NVARCHAR(255)")
    private String email;

    // Sử dụng @ElementCollection để lưu List<String> vào cơ sở dữ liệu
    @ElementCollection
    @CollectionTable(name = "feedback_type", joinColumns = @JoinColumn(name = "feedbacklist_id"))
    @Column(name = "feedback_type" , columnDefinition = "NVARCHAR(255)")
    private List<String> feedbackType = new ArrayList<>();

    @Column(nullable = false, columnDefinition = "NVARCHAR(500)")
    private String message;

    @Column(name = "feedback_date")
    private LocalDateTime feedBackDate = LocalDateTime.now() ;

    public FeedbackList() {
        super();
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<String> getFeedbackType() {
        return feedbackType;
    }

    public void setFeedbackType(List<String> feedbackType) {
        this.feedbackType = feedbackType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getFeedBackDate() {
        return feedBackDate;
    }

    public void setFeedBackDate(LocalDateTime feedBackDate) {
        this.feedBackDate = feedBackDate;
    }

    @Override
    public String toString() {
        return "FeedbackList{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", feedbackType=" + feedbackType +
                ", message='" + message + '\'' +
                ", feedBackDate=" + feedBackDate +
                '}';
    }
}
