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

// Hàm mở modal và thiết lập dữ liệu
function openModal(type, id = '', name = '', email = '', password = '', phone = '',address = '', gender = '', birthday = '', createdDate = '') {
    const modalTitle = document.getElementById('customerModalLabel');
    const customerId = document.getElementById('customerId');
    const customerName = document.getElementById('customerName');
    const customerEmail = document.getElementById('customerEmail');
    const customerPassword = document.getElementById('customerPassword');
    const customerPhone = document.getElementById('customerPhone');
    const customerAddress = document.getElementById('customerAddress');
    const customerGender = document.getElementById('customerGender');
    const customerBirthday = document.getElementById('customerBirthday');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới khách hàng';
        customerId.value = '';
        customerName.value = '';
        customerEmail.value = '';
        customerPhone.value = '';
        customerPassword.value = '';
        customerAddress.value = '';
        customerGender.value = '';
        customerBirthday.value = '';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa khách hàng';
        customerId.value = id;
        customerName.value = name;
        customerEmail.value = email;
        customerPhone.value = phone;
        customerPassword.value = password;
        customerAddress.value = address;
        customerGender.value = gender;
        customerBirthday.value = birthday;
    }
}


function openDeleteModal(id, name) {
    document.getElementById("deleteCustomerId").value = id;
    document.getElementById("deleteCustomerName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteCustomerModal')).show();
}


function viewDetails(id, name, email, password, phone, address, gender, birthday, createdDate) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailName").textContent = name;
    document.getElementById("detailEmail").textContent = email;
    document.getElementById("detailPassword").textContent = password;
    document.getElementById("detailPhone").textContent = phone;
    document.getElementById("detailAddress").textContent = address;
    document.getElementById("detailGender").textContent = gender;
    document.getElementById("detailBirthday").textContent = birthday;
    document.getElementById("detailCreatedDate").textContent = createdDate;
}




