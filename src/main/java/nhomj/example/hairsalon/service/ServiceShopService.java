package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@org.springframework.stereotype.Service
public class ServiceShopService {
    public ServiceRepository serviceRepository;
    public UpLoadService upLoadService;

    @Autowired
    public ServiceShopService(ServiceRepository serviceRepository , UpLoadService upLoadService) {
        this.serviceRepository = serviceRepository;
        this.upLoadService = upLoadService;
    }

    public List<Service> getAllServiceShops() {
        return serviceRepository.findAll();
    }

    public Service getServiceById(long id) {
        return this.serviceRepository.findById(id);
    }

    public Service saveService(Service service) {
        return this.serviceRepository.save(service);
    }

    public void deleteServiceById(long id) {
        Service service = getServiceById(id);
        upLoadService.deleteFile(service.getAvatar(), "service");
        this.serviceRepository.deleteById(id);
    }

}
