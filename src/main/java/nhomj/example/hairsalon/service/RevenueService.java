package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.repository.RevenueRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RevenueService {
    RevenueRepository revenueRepository;

    public RevenueService(RevenueRepository revenueRepository) {
        this.revenueRepository = revenueRepository;
    }

    public List<Revenue> getAllRevenues() {
        return revenueRepository.findAll();
    }
}
