package nhomj.example.hairsalon.model;

public class BookingEvent {

    private String title;
    private String start;
    private String end;
    private String customerName;
    private String status;

    public BookingEvent() {
    }

    public BookingEvent(String title, String start, String end, String customerName, String status) {
        this.title = title;
        this.start = start;
        this.end = end;
        this.customerName = customerName;
        this.status = status;
    }

    // Getters và Setters

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
