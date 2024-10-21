package nhomj.example.hairsalon.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {


    @GetMapping("/admin")
    public String admin(){
        return "admin/dashboard/show";
    }


    @GetMapping("/admin/customer_management")
    public String customerManagement(Model model){
        //danh sach khach hang

        return "admin/dashboard/customer_management";
    }

    @GetMapping("/admin/notification")
    public String notification(Model model){

        return "admin/notification/show";
    }

    @GetMapping("/admin/notification/create")
    public String createNotification(Model model){

        return "admin/notification/create";
    }

    @GetMapping("/admin/notification/update")
    public String updateNotification(Model model){

        return "admin/notification/update";
    }

    @GetMapping("/admin/notification/delete")
    public String deleteNotification(Model model){

        return "admin/notification/delete";
    }

    @GetMapping("/admin/notification/detail")
    public String detailNotification(Model model){

        return "admin/notification/detail";
    }




}
