
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
        data: {
            // Sắp xếp giảm dần theo cột ID (cột đầu tiên)
            sort: { column: 0, order: "desc" } // Sắp xếp cột ID theo thứ tự giảm dần
        }
    });

// Lọc doanh thu theo ngày
function filterRevenue() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    if (new Date(startDate) > new Date(endDate)) {
        alert('Ngày bắt đầu không được lớn hơn ngày kết thúc.');
        return false;
    }

    // Logic lọc doanh thu theo ngày sẽ thực hiện ở đây (sử dụng AJAX để tải dữ liệu mới)
    alert(`Lọc doanh thu từ ${startDate} đến ${endDate}`);
    return false; // Xóa dòng này khi triển khai thực tế
}

// Khởi tạo biểu đồ doanh thu


// Hàm xuất dữ liệu ra file Excel
function exportToExcel() {
    const table = document.getElementById('revenueTable');
    const wb = XLSX.utils.table_to_book(table, { sheet: "Doanh thu" });
    XLSX.writeFile(wb, 'Doanh_thu.xlsx');
}