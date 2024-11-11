package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.StaffSalary;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.StaffSalaryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffSalaryService {

    StaffSalaryRepository staffSalaryRepository;
    StaffRepository staffRepository;

    public StaffSalaryService(StaffSalaryRepository staffSalaryRepository, StaffRepository staffRepository) {
        this.staffSalaryRepository = staffSalaryRepository;
        this.staffRepository = staffRepository;
    }

    public List<StaffSalary> getAllStaff() {
        return this.staffSalaryRepository.findAll();
    }

    public List<Staff> getAllStaffName() {
        return this.staffRepository.findAll();
    }

    public Double getTotalSalary(List<StaffSalary> staffSalaries) {
        Double totalSalary = 0.0;
        for (StaffSalary staffSalary : staffSalaries) {
            totalSalary = totalSalary + staffSalary.getTotalSalary();
        }
        return totalSalary;
    }
}
