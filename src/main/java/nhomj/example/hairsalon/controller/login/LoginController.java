package nhomj.example.hairsalon.controller.login;

import nhomj.example.hairsalon.model.User;
import  nhomj.example.hairsalon.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api")  // Đường dẫn cơ bản cho API
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User user) {
        User authenticatedUser = userService.authenticate(user.getUsername(), user.getPassword());

        if (authenticatedUser != null) {
            return ResponseEntity.ok(Map.of("success", true, "vai_tro_id", authenticatedUser.getVaiTroId()));
        } else {
            return ResponseEntity.ok(Map.of("success", false, "message", "Đăng nhập thất bại."));
        }
    }
}
