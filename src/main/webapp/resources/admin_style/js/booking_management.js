// booking_management.js

// Kiểm tra xem file JS có được tải hay không
console.log("booking_management.js đã được tải thành công");

// Khởi tạo DataTable
const datatablesSimple = new simpleDatatables.DataTable("#datatablesSimple", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} lịch hẹn",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo",
        },
    },
});

let bookingModal;

// Gán hàm openModal vào window để nó có thể được gọi từ mọi nơi
window.openModal = function(
    type,
    id = "",
    customerId = "",
    date = "",
    appointmentTime = "",
    serviceId = "",
    status = "",
    staffId = "",
    customerName = "",
    customerEmail = "",
    customerPhone = "",
    customerAddress = "",
    customerBirthday = "",
    customerGender = ""
) {
    console.log("Hàm openModal được gọi với type:", type);
    const modalTitle = document.getElementById("bookingModalLabel");
    const bookingId = document.getElementById("bookingForm").querySelector("input[name='id']");
    const customerNameInput = document.getElementById("customerName");
    const customerEmailInput = document.getElementById("customerEmail");
    const customerPhoneInput = document.getElementById("customerPhone");
    const customerAddressInput = document.getElementById("customerAddress");
    const customerBirthdayInput = document.getElementById("customerBirthday");
    const customerGenderSelect = document.getElementById("customerGender");
    const bookingDateInput = document.getElementById("bookingDate");
    const appointmentTimeSelect = document.getElementById("appointmentTime");
    const serviceSelect = document.getElementById("service");
    const statusSelect = document.getElementById("status");
    const staffSelect = document.getElementById("staff");

    if (type === "new") {
        modalTitle.textContent = "Thêm lịch hẹn mới";
        bookingId.value = "";
        customerNameInput.value = "";
        customerEmailInput.value = "";
        customerPhoneInput.value = "";
        customerAddressInput.value = "";
        customerBirthdayInput.value = "";
        customerGenderSelect.value = "";
        bookingDateInput.value = "";
        appointmentTimeSelect.value = "";
        serviceSelect.value = "";
        statusSelect.value = "DaDat"; // Đặt trạng thái mặc định là Đã Đặt
        staffSelect.value = "";
    } else if (type === "edit") {
        modalTitle.textContent = "Chỉnh sửa lịch hẹn";
        bookingId.value = id;
        customerNameInput.value = customerName;
        customerEmailInput.value = customerEmail;
        customerPhoneInput.value = customerPhone;
        customerAddressInput.value = customerAddress;
        customerBirthdayInput.value = customerBirthday;
        customerGenderSelect.value = customerGender;
        bookingDateInput.value = date;
        appointmentTimeSelect.value = appointmentTime;
        serviceSelect.value = serviceId;
        statusSelect.value = status;
        staffSelect.value = staffId;
    }

    bookingModal = new bootstrap.Modal(document.getElementById("bookingModal"));
    bookingModal.show();

    // Đặt giới hạn cho ngày sinh không được chọn tương lai
    if (type === "new" || type === "edit") {
        const today = new Date().toISOString().split('T')[0];
        customerBirthdayInput.setAttribute('max', today);
    }
}

function viewDetails(
    id,
    name,
    nameStaff,
    service,
    date,
    appointmentTime,
    status
) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailUser").textContent = name;
    document.getElementById("detailService").textContent = service;
    document.getElementById("detailStaff").textContent = nameStaff;
    document.getElementById("detailDate").textContent = date;
    document.getElementById("detailAppointmentTime").textContent = appointmentTime;
    document.getElementById("detailStatus").textContent = status;
}

function openCancelModal(id, name) {
    document.getElementById("cancelForm").querySelector("input[name='id']").value = id;
    document.getElementById("cancelName").innerText = name;
    new bootstrap.Modal(document.getElementById("cancelModal")).show();
}

// Thêm console.log để kiểm tra xem hàm có được gọi hay không
document.querySelectorAll('button[onclick^="openModal"]').forEach(button => {
    button.addEventListener('click', () => {
        console.log('openModal được gọi');
    });
});

// Thêm kiểm tra khi chọn giờ hẹn không được đặt ở quá khứ
document.getElementById("bookingForm").addEventListener("submit", function(event) {
    const bookingDate = document.getElementById("bookingDate").value;
    const appointmentTime = document.getElementById("appointmentTime").value;

    if (bookingDate && appointmentTime) {
        const selectedDateTime = new Date(`${bookingDate}T${appointmentTime}`);
        const now = new Date();

        if (selectedDateTime < now) {
            event.preventDefault();
            alert("Giờ hẹn không được đặt ở quá khứ.");
        }
    }
});
