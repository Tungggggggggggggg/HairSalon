package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Invoice;
import nhomj.example.hairsalon.repository.InvoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
