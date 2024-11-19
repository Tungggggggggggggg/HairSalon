package nhomj.example.hairsalon.dto;

public class StaffDTO {
    private Long id;
    private String name;

    public StaffDTO() {}

    public StaffDTO(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters và Setters
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
