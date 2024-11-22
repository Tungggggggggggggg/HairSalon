package nhomj.example.hairsalon.controller.admin;

import nhomj.example.hairsalon.util.StaffSalaryExcelExporter;
import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.service.StaffSalaryService;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.io.IOException;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.time.LocalDate;
import java.time.Month;

@Controller
@RequestMapping("/admin/salary_management")
public class StaffSalaryController {

    private static final Logger logger = LoggerFactory.getLogger(StaffSalaryController.class);

    private final StaffSalaryService staffSalaryService;
    private final StaffService staffService;

    @Autowired
    public StaffSalaryController(StaffSalaryService staffSalaryService, StaffService staffService) {
        this.staffSalaryService = staffSalaryService;
        this.staffService = staffService;
    }

    @GetMapping
    public String salaryManagement(Model model) {
        try {
            List<StaffSalary> latestSalaries = staffSalaryService.getLatestStaffSalaries();
            List<Staff> staffList = staffSalaryService.getAllEmployees();

            model.addAttribute("staffSalaries", latestSalaries);
            model.addAttribute("staffList", staffList);
            model.addAttribute("newSalary", new StaffSalary());
            model.addAttribute("currentYear", java.time.LocalDate.now().getYear()); // Để sử dụng trong JSP
            return "admin/dashboard/salary_management";
        } catch (Exception e) {
            logger.error("Error loading salary management page", e);
            // Redirect to an error page or return an error view
            return "redirect:/admin/error"; // Bạn cần tạo trang error hoặc xử lý phù hợp
        }
    }

    @PostMapping("/save")
    public String saveSalary(@Valid @ModelAttribute("newSalary") StaffSalary staffSalary, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            logger.warn("Validation errors while saving salary: {}", bindingResult.getAllErrors());
            return "redirect:/admin/salary_management";
        }

        try {
            Staff staff = staffSalary.getStaff();
            if (staff == null || staff.getId() == null) {
                logger.warn("Staff not provided or invalid");
                return "redirect:/admin/salary_management";
            }
            staff = staffService.getStaffById(staff.getId());
            if (staff == null) {
                logger.warn("Staff with ID {} not found", staffSalary.getStaff().getId());
                return "redirect:/admin/salary_management";
            }
            staffSalary.setStaff(staff);

            // Thiết lập tháng và năm cho lương mới
            LocalDate currentDate = LocalDate.now();
            staffSalary.setMonth(currentDate.getMonthValue());
            staffSalary.setYear(currentDate.getYear());

            // Lưu lương
            staffSalaryService.saveStaffSalary(staffSalary);
            logger.info("Saved salary for staff ID {}", staff.getId());
        } catch (Exception e) {
            logger.error("Error saving salary", e);
        }
        return "redirect:/admin/salary_management";
    }
    
    @PostMapping("/delete")
    public String deleteSalary(@RequestParam("salaryId") Long salaryId) {
        try {
            StaffSalary existingSalary = staffSalaryService.getStaffSalaryById(salaryId);
            if (existingSalary != null) {
                staffSalaryService.deleteStaffSalary(existingSalary);
                logger.info("Deleted salary with ID {}", salaryId);
            } else {
                logger.warn("Salary with ID {} not found for deletion", salaryId);
            }
        }
        catch (Exception e) {
            logger.error("Error deleting salary with ID " + salaryId, e);
            // Optionally, redirect to an error page
        }
        return "redirect:/admin/salary_management";
    }

    @GetMapping("/excel")
    public void exportSalaryToExcel(HttpServletResponse response) {
        try {
            List<StaffSalary> staffSalaries = staffSalaryService.getAllStaffSalaries();

            // Export
            StaffSalaryExcelExporter excelExporter = new StaffSalaryExcelExporter(staffSalaries);
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            String headerKey = "Content-Disposition";
            String headerValue = "attachment; filename=luong_nhan_vien.xlsx";
            response.setHeader(headerKey, headerValue);

            excelExporter.export(response);
            logger.info("Successfully exported salaries to Excel");
        } catch (Exception e) {
            logger.error("Error exporting salaries to Excel", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/history/{staffId}")
    @ResponseBody
    public ResponseEntity<List<StaffSalary>> viewSalaryHistory(@PathVariable Long staffId) {
        try {
            Staff staff = staffService.getStaffById(staffId);
            if (staff == null) {
                logger.warn("Staff with ID {} not found for salary history", staffId);
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
            List<StaffSalary> salaryHistory = staffSalaryService.getStaffSalaryByStaffId(staffId);
            return new ResponseEntity<>(salaryHistory, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error loading salary history for staff ID " + staffId, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}