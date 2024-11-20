package nhomj.example.hairsalon.dto;

public class StaffDTO {
    private Long id;
    private String name;
    private String avatar;

    public StaffDTO(Long id, String name, String avatar) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
    }

    // Getters và Setters
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
