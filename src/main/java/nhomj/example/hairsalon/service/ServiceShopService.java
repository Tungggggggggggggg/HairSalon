package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.ServiceRepository;

import java.util.List;
@org.springframework.stereotype.Service
public class ServiceShopService {
    public ServiceRepository serviceRepository;

    public ServiceShopService(ServiceRepository serviceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public List<Service> getAllServiceShops() {
        return serviceRepository.findAll();
    }
}
