package nhomj.example.hairsalon.service;

import nhomj.example.hairsalon.model.Revenue;
import nhomj.example.hairsalon.model.Staff;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class exportToExCelService {
public byte[] exportRevenueToExcel(List<Revenue> revenues) throws IOException {
    Workbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Danh sách Doanh Thu");

    // Tạo định dạng cho header
    CellStyle headerStyle = workbook.createCellStyle();
    Font headerFont = workbook.createFont();
    headerFont.setBold(true);
    headerStyle.setFont(headerFont);

    Row headerRow = sheet.createRow(0);
    headerRow.createCell(0).setCellValue("ID");
    headerRow.createCell(1).setCellValue("Ngày");
    headerRow.createCell(2).setCellValue("Số Dịch Vụ");
    headerRow.createCell(3).setCellValue("Số Lượng Booking");
    headerRow.createCell(4).setCellValue("Tổng Tiền");

    // Áp dụng định dạng cho header
    for (int i = 0; i <= 4; i++) {
        headerRow.getCell(i).setCellStyle(headerStyle);
    }

    int rowNum = 1;
    for (Revenue revenue : revenues) {
        Row row = sheet.createRow(rowNum++);
        row.createCell(0).setCellValue(revenue.getSummaryId());
        row.createCell(1).setCellValue(revenue.getSummaryDate().toString());
        row.createCell(2).setCellValue(revenue.getTotalServices());
        row.createCell(3).setCellValue(revenue.getNumberOfBookings());
        row.createCell(4).setCellValue(revenue.getTotalRevenue().doubleValue());
    }

    for (int i = 0; i <= 4; i++) {
        sheet.autoSizeColumn(i);
    }

    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
    workbook.write(byteArrayOutputStream);
    workbook.close();

    return byteArrayOutputStream.toByteArray();
}

    public byte[] exportStaffToExcel(List<Staff> staffList) throws IOException {

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("DanhsachNhanVien");

        // Tạo dòng đầu tiên (tiêu đề cột)
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Avatar");
        headerRow.createCell(2).setCellValue("Tên Nhân viên");
        headerRow.createCell(3).setCellValue("Email");
        headerRow.createCell(4).setCellValue("Phone");
        headerRow.createCell(5).setCellValue("Địa chỉ");
        headerRow.createCell(6).setCellValue("Giới tính");
        headerRow.createCell(7).setCellValue("Ngày sinh");
        headerRow.createCell(8).setCellValue("Kinh nghiệm");
        headerRow.createCell(9).setCellValue("Chức vụ");
        headerRow.createCell(10).setCellValue("Ngày vào làm");


        int rowNum = 1;
        for (Staff staff : staffList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(staff.getId());
            row.createCell(1).setCellValue(staff.getAvatar());
            row.createCell(2).setCellValue(staff.getName());
            row.createCell(3).setCellValue(staff.getEmail());
            row.createCell(4).setCellValue(staff.getPhone());
            row.createCell(5).setCellValue(staff.getAddress());
            row.createCell(6).setCellValue(staff.getFormattedGender());
            row.createCell(7).setCellValue(staff.getFormattedBirthday());
            row.createCell(8).setCellValue(staff.getExperience());
            row.createCell(9).setCellValue(staff.getFormattedRole());
            row.createCell(10).setCellValue(staff.getFormattedCreatedDate());
        }


        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        workbook.write(byteArrayOutputStream);
        workbook.close();

        return byteArrayOutputStream.toByteArray();
    }
}
