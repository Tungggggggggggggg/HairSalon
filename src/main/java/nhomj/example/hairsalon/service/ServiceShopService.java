package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@org.springframework.stereotype.Service
public class ServiceShopService {
    public ServiceRepository serviceRepository;

    @Autowired
    public ServiceShopService(ServiceRepository serviceRepository) {
        this.serviceRepository = serviceRepository;
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
        this.serviceRepository.deleteById(id);
    }

}
