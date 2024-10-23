const revenueTable = new simpleDatatables.DataTable("#revenueTable", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} doanh thu",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
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
const ctx = document.getElementById('revenueChart').getContext('2d');
const revenueChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['2024-10-25', '2024-10-26', '2024-10-27'], // Dữ liệu mẫu
        datasets: [{
            label: 'Doanh thu (VNĐ)',
            data: [2000000, 2500000, 3000000], // Dữ liệu mẫu
            fill: false,
            borderColor: 'rgba(75, 192, 192, 1)',
            tension: 0.1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            tooltip: {
                callbacks: {
                    label: function(tooltipItem) {
                        return tooltipItem.raw.toLocaleString('vi-VN') + ' VNĐ';
                    }
                }
            }
        },
        scales: {
            x: {
                title: {
                    display: true,
                    text: 'Ngày'
                }
            },
            y: {
                title: {
                    display: true,
                    text: 'Doanh thu (VNĐ)'
                },
                beginAtZero: true
            }
        }
    }
});

// Hàm xuất dữ liệu ra file Excel
function exportToExcel() {
    const table = document.getElementById('revenueTable');
    const wb = XLSX.utils.table_to_book(table, { sheet: "Doanh thu" });
    XLSX.writeFile(wb, 'Doanh_thu.xlsx');
}