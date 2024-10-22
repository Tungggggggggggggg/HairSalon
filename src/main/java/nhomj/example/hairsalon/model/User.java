package nhomj.example.hairsalon.model;

import jakarta.persistence.*;
import jdk.jfr.DataAmount;
import java.util.List;

@Table(name = "NguoiDung")
public class User {

    @Column(name = "ten_dang_nhap", unique = true, nullable = false)
    private String username;

    @Column(name = "mat_khau", nullable = false)
    private String password;

    @Column(name = "vai_tro_id")
    private int vaiTroId;

    // Getter và Setter
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getVaiTroId() {
        return vaiTroId;
    }

    public void setVaiTroId(int vaiTroId) {
        this.vaiTroId = vaiTroId;
    }
}
