window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            labels: {
                placeholder: "Tìm kiếm...",
                perPage: " mục trên mỗi trang",
                noRows: "Không có dữ liệu để hiển thị",
                info: "Hiển thị {start} đến {end} trong tổng {rows} mục",
                // Nếu cần thêm các nhãn khác, bạn có thể thêm ở đây
            },
            // Bạn có thể thêm các tùy chọn khác nếu cần
        });
    }
});
