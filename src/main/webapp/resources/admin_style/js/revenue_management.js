// Khởi tạo bảng với Simple DataTables
const revenueTable = new simpleDatatables.DataTable("#revenueTable", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    perPage: 10, // Số hàng mặc định trên mỗi trang
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} doanh thu",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    },
});

// Lọc doanh thu theo ngày
function filterRevenue() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    // Kiểm tra ngày bắt đầu và ngày kết thúc
    if (new Date(startDate) > new Date(endDate)) {
        alert('Ngày bắt đầu không được lớn hơn ngày kết thúc.');
        return false;
    }

    // Thực hiện lọc doanh thu theo ngày (sử dụng AJAX để tải dữ liệu mới từ server)
    alert(`Lọc doanh thu từ ${startDate} đến ${endDate}`);

    // Sau khi lọc, có thể cập nhật lại bảng doanh thu (tạm thời là một thông báo ở đây)
    // Gọi AJAX để lấy dữ liệu từ server và cập nhật bảng (chưa làm ở đây)

    return false; // Tạm thời không submit form
}

// Hàm xuất dữ liệu ra file Excel
function exportToExcel() {
    const table = document.getElementById('revenueTable');

    // Tạo workbook từ bảng
    const wb = XLSX.utils.table_to_book(table, { sheet: "Doanh thu" });

    // Đặt tên file với định dạng ngày xuất
    const date = new Date();
    const formattedDate = `${date.getFullYear()}_${date.getMonth() + 1}_${date.getDate()}`;
    const fileName = `Doanh_thu_${formattedDate}.xlsx`;

    // Ghi file Excel
    XLSX.writeFile(wb, fileName);
}
