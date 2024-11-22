package nhomj.example.hairsalon.repository;

import nhomj.example.hairsalon.model.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long> {

    Invoice findInvoiceByBookingId(long id);

    List<Invoice> findInvoiceByInvoiceDate(LocalDate invoiceDate);
}
