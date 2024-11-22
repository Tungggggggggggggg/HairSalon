package nhomj.example.hairsalon.util;

import nhomj.example.hairsalon.model.StaffSalary;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

public class StaffSalaryExcelExporter {
    private XSSFWorkbook workbook;
    private Sheet sheet;
    private List<StaffSalary> staffSalaries;
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");

    public StaffSalaryExcelExporter(List<StaffSalary> staffSalaries) {
        this.staffSalaries = staffSalaries;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet("LuongNhanVien");

        int rowCount = 0;
        Row headerRow = sheet.createRow(rowCount++);

        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);

        createCell(headerRow, 0, "Tên Nhân viên", style);
        createCell(headerRow, 1, "Lương Cơ Bản (VNĐ)", style);
        createCell(headerRow, 2, "Thưởng (VNĐ)", style);
        createCell(headerRow, 3, "Trạng Thái", style);
        createCell(headerRow, 4, "Ngày Cập Nhật", style);
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Long) {
            cell.setCellValue((Long) value);
        } else if (value instanceof String) {
            cell.setCellValue((String) value);
        } else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof BigDecimal) {
            cell.setCellValue(((BigDecimal) value).doubleValue());
        } else {
            cell.setCellValue(String.valueOf(value));
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        // Tổ chức dữ liệu theo nhân viên
        Map<String, List<StaffSalary>> salariesByStaff = staffSalaries.stream()
                .collect(Collectors.groupingBy(salary -> salary.getStaff().getName()));

        CellStyle defaultStyle = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(false);
        defaultStyle.setFont(font);

        // Currency cell style
        CreationHelper createHelper = workbook.getCreationHelper();
        CellStyle currencyCellStyle = workbook.createCellStyle();
        short currencyFormat = createHelper.createDataFormat().getFormat("#,##0");
        currencyCellStyle.setDataFormat(currencyFormat);
        currencyCellStyle.setFont(font);

        // Date cell style
        CellStyle dateCellStyle = workbook.createCellStyle();
        short dateFormat = createHelper.createDataFormat().getFormat("dd/MM/yyyy HH:mm:ss");
        dateCellStyle.setDataFormat(dateFormat);
        dateCellStyle.setFont(font);

        int rowCount = 1;
        for (Map.Entry<String, List<StaffSalary>> entry : salariesByStaff.entrySet()) {
            String staffName = entry.getKey();
            List<StaffSalary> salaries = entry.getValue();

            // Đầu tiên, thêm tên nhân viên
            Row staffRow = sheet.createRow(rowCount++);
            createCell(staffRow, 0, staffName, defaultStyle);
            // Các cột khác để tạo không gian cho dữ liệu lịch sử lương
            for (int i = 1; i <= 4; i++) {
                createCell(staffRow, i, "", defaultStyle);
            }

            // Sau đó, thêm các bản ghi lương của nhân viên
            for (StaffSalary salary : salaries) {
                Row row = sheet.createRow(rowCount++);
                createCell(row, 0, "", defaultStyle); // Không cần tên nhân viên ở các dòng sau
                Cell baseSalaryCell = row.createCell(1);
                baseSalaryCell.setCellValue(salary.getBaseSalary().doubleValue());
                baseSalaryCell.setCellStyle(currencyCellStyle);

                Cell bonusCell = row.createCell(2);
                bonusCell.setCellValue(salary.getBonus().doubleValue());
                bonusCell.setCellStyle(currencyCellStyle);

                createCell(row, 3, salary.getStatus().toString(), defaultStyle);

                Cell updateDateCell = row.createCell(4);
                updateDateCell.setCellValue(salary.getFormattedCreateDate()); // Sử dụng ngày đã được định dạng
                updateDateCell.setCellStyle(dateCellStyle);
            }

            // Thêm một dòng trống sau mỗi nhân viên
            rowCount++;
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        try {
            writeHeaderLine();
            writeDataLines();

            ServletOutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            workbook.close();
            // Không cần đóng outputStream; container sẽ xử lý
        } catch (IOException e) {
            // Nếu có lỗi trong quá trình xuất, ném lại ngoại lệ để controller xử lý
            throw e;
        }
    }
}
