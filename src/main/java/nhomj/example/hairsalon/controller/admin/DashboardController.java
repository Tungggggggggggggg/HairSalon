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

    @GetMapping("/admin/service_management")
    public String serviceManagement(Model model){
        //danh sach khach hang

        return "admin/dashboard/service_management";
    }
    @GetMapping("/admin/personnel_management")
    public String Management(Model model){
        //danh sach khach hang

        return "admin/dashboard/personnel_management";
    }
    @GetMapping("/admin/booking")
    public String calendarManagement(Model model){
        //danh sach khach hang

        return "admin/dashboard/booking";
    }
    @GetMapping("/admin/revenue_management")
    public String revenueManagement(Model model){
        //danh sach khach hang

        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/response_list")
    public String responseList(Model model){
        //danh sach khach hang

        return "admin/dashboard/response_list";
    }

}
