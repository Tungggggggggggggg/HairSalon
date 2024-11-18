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

    public List<Service> getAllServiceShops() {
        return serviceRepository.findAll();
    }

    public Service getServiceById(long id) {
        return serviceRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Service not found with id: " + id));
    }

    public Service saveService(Service service) {
        return serviceRepository.save(service);
    }

    public void deleteServiceById(long id) {
        Service service = getServiceById(id);
        upLoadService.deleteFile(service.getAvatar(), "service");
        serviceRepository.deleteById(id);
    }
}
