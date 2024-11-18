// Khởi tạo bảng dữ liệu với Simple DataTables và thiết lập ngôn ngữ tiếng Việt
const datatablesSimple = new simpleDatatables.DataTable("#datatablesSimple", {
    perPageSelect: false, // Ẩn phần chọn số lượng mục mỗi trang
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} mục",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    }
});

function openDeleteModal(id, name) {
    document.getElementById("deleteId").value = id;
    document.getElementById("deleteName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteModal')).show();
}

function viewDetails(id, name, email, phone, feedbackType, message, feedBackDate) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailUser").textContent = name;
    document.getElementById("detailEmail").textContent = email;
    document.getElementById("detailPhone").textContent = phone;
    document.getElementById("detailFeedbackType").textContent = feedbackType;
    document.getElementById("detailMessage").textContent = message;
    document.getElementById("detailFeedBackDate").textContent = feedBackDate;
}