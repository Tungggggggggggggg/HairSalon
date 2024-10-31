package nhomj.example.hairsalon.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AppointmentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getAllAppointments() {
        String sql = "SELECT b.id, u.name AS customer_name, b.booking_date, s.name AS service_name, st.name AS staff_name, b.status " +
                     "FROM booking b " +
                     "JOIN users u ON b.customer_id = u.id " +
                     "JOIN service s ON b.service_id = s.id " +
                     "JOIN staff st ON b.staff_id = st.id";
        return jdbcTemplate.queryForList(sql);
    }
}
