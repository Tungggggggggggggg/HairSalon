package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@org.springframework.stereotype.Service

public class ServiceShopService {
    public final ServiceRepository serviceRepository;
    public final UpLoadService upLoadService;

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
     * @return đối tượng Service nếu tìm thấy, ngược lại trả về null.
     */
    public nhomj.example.hairsalon.model.Service getServiceById(long id) {
        nhomj.example.hairsalon.model.Service service = serviceRepository.findById(id);
        if (service == null) {
            throw new RuntimeException("Service not found with id: " + id);
        }
        return service;
    }

    /**
     * Lưu dịch vụ mới hoặc cập nhật dịch vụ hiện có.
     * @param service đối tượng Service cần lưu.
     * @return đối tượng Service đã lưu.
     */
    public nhomj.example.hairsalon.model.Service saveService(nhomj.example.hairsalon.model.Service service) {
        return serviceRepository.save(service);
    }

    /**
     * Xóa dịch vụ theo ID.
     * @param id ID của dịch vụ cần xóa.
     */
    public void deleteServiceById(long id) {
        nhomj.example.hairsalon.model.Service service = getServiceById(id);
        upLoadService.deleteFile(service.getAvatar(), "service");
        serviceRepository.deleteById(id);
    }
}
