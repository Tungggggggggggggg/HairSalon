package nhomj.example.hairsalon.controller.admin;

import jakarta.servlet.http.HttpServletResponse;
import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.service.RevenueService;
import nhomj.example.hairsalon.util.RevenueExcelExporter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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
        List<BigDecimal> month = revenueService.getRevenueByMonth();
        List<BigDecimal> year = revenueService.getRevenueByYear();
        model.addAttribute("revenues", revenues);
        model.addAttribute("week", week);
        model.addAttribute("month", month);
        model.addAttribute("year", year);
        // Pass empty strings for startDate and endDate
        model.addAttribute("startDate", "");
        model.addAttribute("endDate", "");
        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/revenue_management/filter")
    public String filterRevenue(Model model, @RequestParam("startDate") String startDateStr,
                                @RequestParam("endDate") String endDateStr) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        List<Revenue> revenues = revenueService.getRevenueByDate(startDate, endDate);
        List<BigDecimal> week = revenueService.getRevenueByWeek();
        List<BigDecimal> month = revenueService.getRevenueByMonth();
        List<BigDecimal> year = revenueService.getRevenueByYear();
        model.addAttribute("revenues", revenues);
        model.addAttribute("week", week);
        model.addAttribute("month", month);
        model.addAttribute("year", year);
        model.addAttribute("startDate", startDateStr);
        model.addAttribute("endDate", endDateStr);
        return "admin/dashboard/revenue_management";
    }

    @GetMapping("/admin/revenue_management/excel")
    public void exportRevenueToExcel(HttpServletResponse response,
                                     @RequestParam(value = "startDate", required = false) String startDateStr,
                                     @RequestParam(value = "endDate", required = false) String endDateStr) throws IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        List<Revenue> revenues;

        try {
            if (startDateStr != null && !startDateStr.trim().isEmpty() &&
                endDateStr != null && !endDateStr.trim().isEmpty()) {
                LocalDate startDate = LocalDate.parse(startDateStr, formatter);
                LocalDate endDate = LocalDate.parse(endDateStr, formatter);
                revenues = revenueService.getRevenueByDate(startDate, endDate);
            } else {
                // Export all revenues
                revenues = revenueService.getAllRevenues();
            }
        } catch (DateTimeParseException e) {
            // Trả về lỗi 400 Bad Request nếu ngày không hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ngày không hợp lệ.");
            return;
        }

        RevenueExcelExporter excelExporter = new RevenueExcelExporter(revenues);
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=doanh_thu.xlsx";
        response.setHeader(headerKey, headerValue);

        excelExporter.export(response);
    }
}
