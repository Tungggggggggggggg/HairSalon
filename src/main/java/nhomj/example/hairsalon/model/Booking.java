package nhomj.example.hairsalon.model;

public class Booking {
    private String name;
    private String phone;
    private String service;

    public Booking() {
    }

    public Booking(String name, String phone, String service) {
        this.name = name;
        this.phone = phone;
        this.service = service;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }
}
