package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.service.RevenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RevenueController {
    public final RevenueService revenueService;

    @Autowired
    public RevenueController(RevenueService revenueService) {
        this.revenueService = revenueService;
    }

    @GetMapping("/admin/revenue_management")
    public String revenueManagement(Model model) {
        List<Revenue> revenues = revenueService.getAllRevenues();
        List<BigDecimal> week = revenueService.getRevenueByWeek();
        List<BigDecimal> month  = revenueService.getRevenueByMonth();
        List<BigDecimal> year = revenueService.getRevenueByYear();
        model.addAttribute("revenues", revenues);
        model.addAttribute("week", week);
        model.addAttribute("month", month);
        model.addAttribute("year", year);
        return "admin/dashboard/revenue_management";
    }
}
