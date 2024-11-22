package nhomj.example.hairsalon.util;

import nhomj.example.hairsalon.model.Revenue;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class RevenueExcelExporter {
    private XSSFWorkbook workbook;
    private Sheet sheet;
    private List<Revenue> revenues;
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public RevenueExcelExporter(List<Revenue> revenues) {
        this.revenues = revenues;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet("DoanhThu");

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);

        createCell(row, 0, "ID", style);
        createCell(row, 1, "Ngày", style);
        createCell(row, 2, "Số Dịch Vụ", style);
        createCell(row, 3, "Số Lượng Booking", style);
        createCell(row, 4, "Tổng Tiền (VNĐ)", style);
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof BigDecimal) {
            cell.setCellValue(((BigDecimal) value).doubleValue());
        } else {
            cell.setCellValue(String.valueOf(value));
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 1;

        CellStyle defaultStyle = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(false);
        defaultStyle.setFont(font);

        // Date cell style
        CreationHelper createHelper = workbook.getCreationHelper();
        CellStyle dateCellStyle = workbook.createCellStyle();
        short dateFormat = createHelper.createDataFormat().getFormat("dd/MM/yyyy");
        dateCellStyle.setDataFormat(dateFormat);
        dateCellStyle.setFont(font);

        // Currency cell style
        CellStyle currencyCellStyle = workbook.createCellStyle();
        short currencyFormat = createHelper.createDataFormat().getFormat("#,##0");
        currencyCellStyle.setDataFormat(currencyFormat);
        currencyCellStyle.setFont(font);

        for (Revenue revenue : revenues) {
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            createCell(row, columnCount++, revenue.getSummaryId(), defaultStyle);

            // Date
            Cell dateCell = row.createCell(columnCount++);
            dateCell.setCellValue(revenue.getSummaryDate().format(formatter));
            dateCell.setCellStyle(dateCellStyle);

            createCell(row, columnCount++, revenue.getTotalServices(), defaultStyle);
            createCell(row, columnCount++, revenue.getNumberOfBookings(), defaultStyle);

            // Total Revenue
            Cell revenueCell = row.createCell(columnCount++);
            revenueCell.setCellValue(revenue.getTotalRevenue().doubleValue());
            revenueCell.setCellStyle(currencyCellStyle);
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
