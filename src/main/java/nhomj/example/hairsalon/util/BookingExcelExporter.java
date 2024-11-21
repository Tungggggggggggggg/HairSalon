package nhomj.example.hairsalon.util;

import nhomj.example.hairsalon.model.Booking;
import nhomj.example.hairsalon.model.Service;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class BookingExcelExporter {
    private XSSFWorkbook workbook;
    private Sheet sheet;
    private List<Booking> bookings;

    public BookingExcelExporter(List<Booking> bookings) {
        this.bookings = bookings;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet("Bookings");

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);

        createCell(row, 0, "ID", style);
        createCell(row, 1, "Khách hàng", style);
        createCell(row, 2, "Email", style);
        createCell(row, 3, "Điện thoại", style);
        createCell(row, 4, "Ngày tạo", style);
        createCell(row, 5, "Ngày hẹn", style);
        createCell(row, 6, "Giờ hẹn", style);
        createCell(row, 7, "Dịch vụ", style);
        createCell(row, 8, "Nhân viên", style);
        createCell(row, 9, "Trạng thái", style);
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Long) {
            cell.setCellValue((Long) value);
        } else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        } else {
            cell.setCellValue(String.valueOf(value));
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 1;

        // Phân loại bookings theo trạng thái
        Map<Booking.Status, List<Booking>> bookingsByStatus = bookings.stream()
                .collect(Collectors.groupingBy(Booking::getStatus));

        for (Booking.Status status : Booking.Status.values()) {
            List<Booking> bookingsInStatus = bookingsByStatus.get(status);
            if (bookingsInStatus != null) {
                // Thêm dòng tiêu đề cho trạng thái
                Row statusRow = sheet.createRow(rowCount++);
                CellStyle statusStyle = workbook.createCellStyle();
                Font statusFont = workbook.createFont();
                statusFont.setBold(true);
                statusStyle.setFont(statusFont);
                createCell(statusRow, 0, "Trạng thái: " + status.name(), statusStyle);

                for (Booking booking : bookingsInStatus) {
                    Row row = sheet.createRow(rowCount++);
                    int columnCount = 0;

                    createCell(row, columnCount++, booking.getId(), null);
                    createCell(row, columnCount++, booking.getCustomer().getName(), null);
                    createCell(row, columnCount++, booking.getCustomer().getEmail(), null);
                    createCell(row, columnCount++, booking.getCustomer().getPhone(), null);
                    createCell(row, columnCount++, booking.getFormattedCreatedDate(), null);
                    createCell(row, columnCount++, booking.getFormattedDate(), null);
                    createCell(row, columnCount++, booking.getFormattedAppointmentTime(), null);

                    String services = booking.getServices().stream()
                            .map(Service::getName)
                            .collect(Collectors.joining(", "));
                    createCell(row, columnCount++, services, null);

                    createCell(row, columnCount++, booking.getStaff().getName(), null);
                    createCell(row, columnCount++, booking.getStatusDisplayName(), null);
                }
            }
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();
    }
}
