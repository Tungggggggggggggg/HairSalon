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

// Biến để lưu các instance của Flatpickr
let bookingDatePicker;
let appointmentTimePicker;
let customerBirthdayPicker;
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
        customerBirthdayPicker.clear(); // Sử dụng Flatpickr instance
        customerGenderSelect.value = "";
        bookingDatePicker.clear(); // Clear Flatpickr input
        appointmentTimePicker.clear(); // Clear Flatpickr time picker
        serviceSelect.selectedIndex = -1; // Đặt lại select dịch vụ
        statusSelect.value = "DaDat"; // Đặt trạng thái mặc định là Đã Đặt
        staffSelect.value = "";

        // Xóa danh sách nhân viên khi thêm mới
        staffSelect.innerHTML = '<option value="">Chọn nhân viên</option>';
    }

    bookingModal = new bootstrap.Modal(document.getElementById("bookingModal"));
    bookingModal.show();

    // Đặt giới hạn cho ngày sinh không được chọn tương lai
    if (type === "new" || type === "edit") {
        const today = new Date().toISOString().split('T')[0];
        customerBirthdayInput.setAttribute('max', today);
    }
}

// Khởi tạo Flatpickr cho trường ngày hẹn trong modal thêm/sửa
bookingDatePicker = flatpickr("#bookingDate", {
    dateFormat: "d/m/Y", // Định dạng dd/MM/yyyy
    minDate: "today",
    locale: "vi",
    onChange: function(selectedDates, dateStr, instance) {
        const selectedDate = selectedDates[0];
        const today = new Date();

        // Nếu người dùng chọn ngày hôm nay, đặt giới hạn giờ là giờ hiện tại
        if (selectedDate && selectedDate.toDateString() === today.toDateString()) {
            const currentHour = today.getHours();
            const currentMinute = today.getMinutes();
            const minTime = `${String(currentHour).padStart(2, '0')}:${String(currentMinute).padStart(2, '0')}`;

            // Cập nhật Flatpickr cho giờ hẹn với minTime là giờ hiện tại
            appointmentTimePicker.set('minTime', minTime);
        } else {
            // Nếu là ngày khác, đặt minTime là giờ mở cửa (ví dụ: 08:00)
            appointmentTimePicker.set('minTime', "08:00");
        }

        // Gọi hàm cập nhật danh sách nhân viên
        fetchAvailableStaff();
    }
});

// Khởi tạo Flatpickr cho trường ngày sinh trong modal thêm/sửa và gán vào biến customerBirthdayPicker
customerBirthdayPicker = flatpickr("#customerBirthday", {
    dateFormat: "d/m/Y", // Định dạng dd/MM/yyyy
    maxDate: "today",
    locale: "vi",
    defaultDate: null
});

// Khởi tạo Flatpickr cho trường giờ hẹn trong modal thêm/sửa
appointmentTimePicker = flatpickr("#appointmentTime", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true,
    minuteIncrement: 30,
    minTime: "08:00",
    maxTime: "21:00",
    onOpen: function(selectedDates, dateStr, instance) {
        const bookingDate = bookingDatePicker.input.value;
        if (bookingDate) {
            const [day, month, year] = bookingDate.split('/');
            const selectedDate = new Date(`${year}-${month}-${day}`);
            const today = new Date();
            if (
                selectedDate.toDateString() === today.toDateString()
            ) {
                const currentHour = today.getHours();
                const currentMinute = today.getMinutes();
                const minTime = `${String(currentHour).padStart(2, '0')}:${String(currentMinute).padStart(2, '0')}`;
                instance.set('minTime', minTime);
            } else {
                instance.set('minTime', "08:00");
            }
        }
    },
    onChange: function(selectedDates, dateStr, instance) {
        // Gọi hàm cập nhật danh sách nhân viên
        fetchAvailableStaff();
    }
});

// Thêm sự kiện khi thay đổi dịch vụ
document.getElementById("service").addEventListener("change", fetchAvailableStaff);

function fetchAvailableStaff() {
    const date = document.getElementById("bookingDate").value;
    const time = document.getElementById("appointmentTime").value;
    const bookingId = document.getElementById("bookingForm").querySelector("input[name='id']").value;

    // Lấy danh sách dịch vụ đã chọn
    const serviceSelect = document.getElementById("service");
    const selectedServices = Array.from(serviceSelect.selectedOptions).map(option => option.value);

    if (date && time) {
        // Gửi yêu cầu AJAX tới server
        $.ajax({
            url: '/admin/booking_management/available_staff',
            type: 'GET',
            traditional: true,
            data: {
                date: date,
                time: time,
                bookingId: bookingId || null,
                services: selectedServices
            },
            success: function(data) {
                // Cập nhật danh sách nhân viên
                const staffSelect = document.getElementById("staff");
                const selectedStaffId = staffSelect.value; // Lưu lại lựa chọn hiện tại

                // Xóa các tùy chọn cũ
                staffSelect.innerHTML = '<option value="">Chọn nhân viên</option>';
                // Thêm các tùy chọn mới
                data.forEach(function(staff) {
                    const option = document.createElement('option');
                    option.value = staff.id;
                    option.textContent = staff.name;
                    staffSelect.appendChild(option);
                });
                // Đặt lại nhân viên đã chọn nếu có
                if (selectedStaffId) {
                    staffSelect.value = selectedStaffId;
                }
            }
        });
    }
}

function viewDetails(
    id,
    name,
    nameStaff,
    date,
    appointmentTime,
    statusDisplayName,
    email,
    phone,
    address,
    birthday,
    gender,
    createdDate,
    services
) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailUser").textContent = name;
    document.getElementById("detailStaff").textContent = nameStaff;
    document.getElementById("detailDate").textContent = date;
    document.getElementById("detailAppointmentTime").textContent = appointmentTime;
    document.getElementById("detailStatus").textContent = statusDisplayName;
    document.getElementById("detailEmail").textContent = email;
    document.getElementById("detailPhone").textContent = phone;
    document.getElementById("detailAddress").textContent = address;
    document.getElementById("detailBirthday").textContent = birthday;
    document.getElementById("detailGender").textContent = gender;
    document.getElementById("detailCreatedDate").textContent = createdDate;

    // Hiển thị danh sách dịch vụ
    let serviceList = "";
    if (services && services.length > 0) {
        services.forEach(serviceName => {
            serviceList += serviceName + "<br/>";
        });
    }
    document.getElementById("detailService").innerHTML = serviceList;
}

function openCancelModal(id, name) {
    document.getElementById("cancelForm").querySelector("input[name='id']").value = id;
    document.getElementById("cancelName").innerText = name;
    new bootstrap.Modal(document.getElementById("cancelModal")).show();
}

function openCompleteModal(id, name) {
    document.getElementById("completeForm").querySelector("input[name='id']").value = id;
    document.getElementById("completeName").innerText = name;
    new bootstrap.Modal(document.getElementById("completeModal")).show();
}

// Thêm console.log để kiểm tra xem hàm có được gọi hay không
document.querySelectorAll('button[onclick^="openModal"]').forEach(button => {
    button.addEventListener('click', () => {
        console.log('openModal được gọi');
    });
});
