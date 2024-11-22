package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Invoice;
import nhomj.example.hairsalon.repository.InvoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class InvoiceService {

    public InvoiceRepository invoiceRepository;

    @Autowired
    public InvoiceService(InvoiceRepository invoiceRepository) {
        this.invoiceRepository = invoiceRepository;
    }

    public Invoice getInvoice(long id) {
        return this.invoiceRepository.findInvoiceByBookingId(id);
    }

    public Invoice saveInvoice(Invoice invoice) {
        return this.invoiceRepository.save(invoice);
    }

    public List<Invoice> getAllInvoicesByInvocieDate(LocalDate invocieDate) {
        return this.invoiceRepository.findInvoiceByInvoiceDate(invocieDate);
    }

    public BigDecimal getTotalInvoice(LocalDate invocieDate) {
        List<Invoice> invoices = this.getAllInvoicesByInvocieDate(invocieDate);
        BigDecimal total = BigDecimal.ZERO;
        if(invoices.isEmpty()) {
            return BigDecimal.ZERO;
        }else{
            for(Invoice invoice : invoices) {
                total = total.add(invoice.getTotalAmount());
            }
        }
        return total;
    }
    public Integer numberOfInvoices() {
        List<Invoice> invoices = this.getAllInvoicesByInvocieDate(LocalDate.now());
        return invoices.size();
    }

    public Integer numberServiceOfInvoices() {
        List<Invoice> invoices = this.getAllInvoicesByInvocieDate(LocalDate.now());

        if (invoices.isEmpty()) {
            return 0;
        }

        int count = 0;
        for (Invoice invoice : invoices) {
            count += invoice.getBooking().getServices().size();
        }

        return count;
    }

}
