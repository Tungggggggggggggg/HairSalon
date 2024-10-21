package nhomj.example.hairsalon.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceController {

    @GetMapping("admin/service")
    public String service() {


        return "admin/service/show";
    }

    @GetMapping("admin/service/create")
    public String createSevice() {

        return "admin/service/create";
    }

    @GetMapping("admin/service/update")
    public String updateSevice() {

        return "admin/service/update";
    }

    @GetMapping("admin/service/delete")
    public String deleteSevice() {

        return "admin/service/delete";
    }

    @GetMapping("admin/service/detail")
    public String detailSevice() {

        return "admin/service/detail";
    }
}
