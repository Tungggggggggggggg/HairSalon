package nhomj.example.hairsalon.service;

import jakarta.persistence.EntityNotFoundException;
import nhomj.example.hairsalon.model.Staff;
import nhomj.example.hairsalon.model.User;
import nhomj.example.hairsalon.repository.StaffRepository;
import nhomj.example.hairsalon.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
@Service
public class StaffService {

    public StaffRepository staffRepository;
    public UserRepository userRepository;
    public UpLoadService upLoadService;

    @Autowired
    public StaffService(StaffRepository staffRepository, UserRepository userRepository, UpLoadService upLoadService) {
        this.staffRepository = staffRepository;
        this.userRepository = userRepository;
        this.upLoadService = upLoadService;
    }

    public List<Staff> getAllStaff() {
        return this.staffRepository.findAll();
    }
    public Staff getStaffById(long id) {
        return this.staffRepository.findById(id);
    }

    public LocalDateTime date(){
        return LocalDateTime.now();
    }

    public void saveStaff(Staff staff) {
        staffRepository.save(staff);
    }

    public void deleteStaff(Staff staff) {
        Staff checkStaff = getStaffById(staff.getId());
        System.out.println(checkStaff.getAvatar());
        upLoadService.deleteFile(checkStaff.getAvatar(),"avatar" );
        staffRepository.delete(checkStaff);
    }
}
