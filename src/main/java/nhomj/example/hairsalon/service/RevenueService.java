package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.model.Service;
import nhomj.example.hairsalon.repository.RevenueRepository;
import org.springframework.data.domain.Sort;

import java.math.BigDecimal;
import java.time.*;
import java.util.List;
import java.util.Optional;

@org.springframework.stereotype.Service
public class RevenueService {

    public final RevenueRepository revenueRepository;
    public final InvoiceService invoiceService;


    public long countReven()
    {
        return revenueRepository.count();
    }

    public RevenueService(RevenueRepository revenueRepository, InvoiceService invoiceService) {
        this.revenueRepository = revenueRepository;
        this.invoiceService = invoiceService;
    }

    BigDecimal TotalPrice = BigDecimal.ZERO;
    public void save(){
        Revenue revenue = this.revenueRepository.findOneBySummaryDate(LocalDate.now());
        TotalPrice = invoiceService.getTotalInvoice(LocalDate.now());
        if(revenue!=null){
            revenue.setTotalRevenue(TotalPrice);
            revenue.setNumberOfBookings(this.invoiceService.numberOfInvoices());
            revenue.setTotalServices(this.invoiceService.numberServiceOfInvoices());
            revenueRepository.save(revenue);
        }
        else {
            revenue = new Revenue();
            revenue.setSummaryDate(LocalDate.now());
            revenue.setTotalRevenue(TotalPrice);
            revenue.setNumberOfBookings(this.invoiceService.numberOfInvoices());
            revenue.setTotalServices(this.invoiceService.numberServiceOfInvoices());
            revenueRepository.save(revenue);
        }
    }

    public List<Revenue> getAllRevenues() {
        return revenueRepository.findAll(Sort.by(Sort.Order.desc("summaryDate")));
    }

    public LocalDate monday() {
        LocalDate today = LocalDate.now();
        LocalDate monday = today;
        while (monday.getDayOfWeek() != DayOfWeek.MONDAY) {
            monday = monday.minusDays(1);
        }
        return monday;
    }

    public LocalDate sunday() {
        LocalDate today = LocalDate.now();
        // Tìm ngày Chủ Nhật gần nhất
        LocalDate sunday = today;
        while (sunday.getDayOfWeek() != DayOfWeek.SUNDAY) {
            sunday = sunday.plusDays(1);
        }
        return sunday;
    }


    public int numberMonth() {
        YearMonth currentMonth = YearMonth.now();
        // Lấy số ngày trong tháng hiện tại
        return currentMonth.lengthOfMonth();
    }

    public List<BigDecimal> getRevenueByWeek() {
        List<BigDecimal> testList = revenueRepository.findByDateRange(monday());
        if (testList.size() < 7) {
            for (int i = testList.size(); i < 7; i++) {
                testList.add(BigDecimal.ZERO);
            }
        }
        return testList;
    }

    public List<BigDecimal> getRevenueByMonth() {
        List<BigDecimal> testList = revenueRepository.findAllInCurrentMonth();
        if (testList.size() < numberMonth()) {
            for (int i = testList.size(); i < numberMonth(); i++) {
                testList.add(BigDecimal.ZERO);
            }
        }
        return testList;
    }

    public double getNumMonth(List<BigDecimal> month) {
        double sum = 0;
        for (int i = 0; i < month.size(); i++) {
            sum += month.get(i).doubleValue();
        }
        return sum;
    }


    public List<BigDecimal> getRevenueByYear() {
        List<BigDecimal> testList = revenueRepository.findAllInCurrentYear();
        if (testList.size() < 12) {
            for (int i = testList.size(); i < 12; i++) {
                testList.add(BigDecimal.ZERO);
            }
        }
        return testList;
    }

    public void updateRevenueForBooking(Booking booking) {
        if (booking.getStatus() != Booking.Status.HoanThanh) {
            return;
        }
        LocalDate date = booking.getDate();
        Optional<Revenue> optionalRevenue = revenueRepository.findBySummaryDate(date);
        Revenue revenue = optionalRevenue.orElse(null);

        BigDecimal bookingTotalPrice = booking.getServices().stream()
                .map(Service::getPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalServices = booking.getServices().size();

        if (revenue == null) {
            // Tạo mới bản ghi doanh thu
            revenue = new Revenue();
            revenue.setSummaryDate(date);
            revenue.setTotalRevenue(bookingTotalPrice);
            revenue.setNumberOfBookings(1);
            revenue.setTotalServices(totalServices);
        } else {
            // Cập nhật bản ghi doanh thu
            revenue.setTotalRevenue(revenue.getTotalRevenue().add(bookingTotalPrice));
            revenue.setNumberOfBookings(revenue.getNumberOfBookings() + 1);
            revenue.setTotalServices(revenue.getTotalServices() + totalServices);
        }
        revenueRepository.save(revenue);
    }

    public List<Revenue> getRevenueByDate(LocalDate startDate, LocalDate endDate) {
        return this.revenueRepository.findAllDate(startDate, endDate);
    }


}
