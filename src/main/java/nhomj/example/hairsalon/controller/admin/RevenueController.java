package nhomj.example.hairsalon.controller.admin;

import jakarta.servlet.http.HttpServletResponse;
import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.service.RevenueService;
import nhomj.example.hairsalon.service.exportToExCelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.http.HttpHeaders;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RevenueController {
    public final RevenueService revenueService;
    public final exportToExCelService exportToExCelService;

    @Autowired
    public RevenueController(RevenueService revenueService, exportToExCelService  exportToExCelService) {
        this.revenueService = revenueService;
        this.exportToExCelService = exportToExCelService;
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

    @GetMapping("/admin/revenue_management/filter")
    public String filterRevenue(Model model, @RequestParam("startDate") String startDate,
                                @RequestParam("endDate") String endDate ) {
        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);

        List<Revenue> revenues = revenueService.getRevenueByDate(start, end);
        List<BigDecimal> week = revenueService.getRevenueByWeek();
        List<BigDecimal> month  = revenueService.getRevenueByMonth();
        List<BigDecimal> year = revenueService.getRevenueByYear();
        model.addAttribute("revenues", revenues);
        model.addAttribute("week", week);
        model.addAttribute("month", month);
        model.addAttribute("year", year);
        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/revenue_management/excel")
    public String revenueManagementExcel(HttpServletResponse response) throws IOException {

        List<Revenue> revenues = revenueService.getAllRevenues();

        byte[] excelFile = exportToExCelService.exportRevenueToExcel(revenues);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=doanh_thu.xlsx");

        OutputStream os = response.getOutputStream();
        os.write(excelFile);
        os.flush();
        os.close();

        return "redirect:/admin/revenue_management";
    }

}
