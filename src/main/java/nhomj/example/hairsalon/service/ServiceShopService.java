package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class ServiceShopService {
    private final ServiceRepository serviceRepository;
    private final UpLoadService upLoadService;

    @Autowired
    public ServiceShopService(ServiceRepository serviceRepository, UpLoadService upLoadService) {
        this.serviceRepository = serviceRepository;
        this.upLoadService = upLoadService;
    }

    /**
     * Lấy tất cả các dịch vụ.
     * @return danh sách các dịch vụ.
     */
    public List<Service> getAllServiceShops() {
        return serviceRepository.findAll();
    }

    /**
     * Lấy chi tiết dịch vụ theo ID.
     * @param id ID của dịch vụ.
     * @return đối tượng Service nếu tìm thấy, ngược lại ném ngoại lệ.
     */
    public Service getServiceById(long id) {
        return serviceRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Service not found with id: " + id));
    }

    /**
     * Lưu dịch vụ mới hoặc cập nhật dịch vụ hiện có.
     * @param service đối tượng Service cần lưu.
     * @return đối tượng Service đã lưu.
     */
    public Service saveService(Service service) {
        return serviceRepository.save(service);
    }

    /**
     * Xóa dịch vụ theo ID.
     * @param id ID của dịch vụ cần xóa.
     */
    public void deleteServiceById(long id) {
        Service service = getServiceById(id);
        upLoadService.deleteFile(service.getAvatar(), "service");
        serviceRepository.deleteById(id);
    }
}
