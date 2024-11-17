document.addEventListener("DOMContentLoaded", function () {
    // Khởi tạo Flatpickr cho trường ngày hẹn với định dạng dd/MM/yyyy, ngôn ngữ tiếng Việt
    const appointmentDatePicker = flatpickr("#appointmentDate", {
        dateFormat: "d/m/Y", // dd/MM/yyyy
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
        }
    });

    // Khởi tạo Flatpickr cho trường ngày sinh
    flatpickr("#dateOfBirth", {
        dateFormat: "d/m/Y", // dd/MM/yyyy
        maxDate: "today",
        locale: "vi"
    });

    // Khởi tạo Flatpickr cho trường giờ hẹn như một time picker
    const appointmentTimePicker = flatpickr("#appointmentTime", {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true,
        minuteIncrement: 30,
        minTime: "08:00",
        maxTime: "21:00"
    });

    // Hiệu ứng focus vào các trường nhập liệu
    const inputs = document.querySelectorAll("input, select, textarea");
    inputs.forEach(input => {
        input.addEventListener("focus", function () {
            this.style.borderColor = "#1e90ff";
            this.style.boxShadow = "0px 0px 8px rgba(30, 144, 255, 0.4)";
        });
        input.addEventListener("blur", function () {
            this.style.borderColor = "#ddd";
            this.style.boxShadow = "none";
        });
    });

    // Xử lý khi mở modal xác nhận
    const confirmModal = document.getElementById('confirmModal');
    confirmModal.addEventListener('show.bs.modal', function (event) {
        // Lấy các giá trị từ form
        const form = document.getElementById('bookingForm');
        const formData = new FormData(form);

        // Lấy thông tin lịch hẹn
        const date = formData.get('date') || 'Không có';
        const time = formData.get('appointmentTime') || 'Không có';
        
        // Lấy danh sách dịch vụ đã chọn
        const servicesSelect = document.getElementById('serviceType');
        const selectedOptions = Array.from(servicesSelect.selectedOptions);
        const services = selectedOptions.map(option => option.textContent.trim());
        const servicesList = services.length > 0 ? services.join(', ') : 'Không có';

        // Lấy thông tin nhân viên phụ trách
        const staffId = formData.get('staff.id');
        let staffName = 'Không có';
        if (staffId) {
            const staffOption = document.querySelector(`#stylist option[value="${staffId}"]`);
            if (staffOption) {
                staffName = staffOption.textContent.trim();
            }
        }

        // Lấy thông tin khách hàng
        const fullName = formData.get('customer.name') || 'Không có';
        const phone = formData.get('customer.phone') || 'Không có';
        const email = formData.get('customer.email') || 'Không có';
        const gender = formData.get('customer.gender') || 'Không có';
        const birthday = formData.get('customer.birthday') || 'Không có';
        const address = formData.get('customer.address') || 'Không có';

        // Xử lý giới tính để hiển thị đầy đủ
        let genderText = 'Không có';
        if (gender === 'Nam') genderText = 'Nam';
        else if (gender === 'Nu') genderText = 'Nữ';
        else if (gender === 'Khac') genderText = 'Khác';

        // Xử lý ngày sinh để định dạng đúng
        const [day, month, year] = birthday.split('/');
        const formattedBirthday = `${day}/${month}/${year}`;

        // Điền thông tin vào modal
        document.getElementById('confirmDate').textContent = date;
        document.getElementById('confirmTime').textContent = time;
        document.getElementById('confirmServices').textContent = servicesList;
        document.getElementById('confirmStylist').textContent = staffName;

        document.getElementById('confirmFullName').textContent = fullName;
        document.getElementById('confirmPhone').textContent = phone;
        document.getElementById('confirmEmail').textContent = email;
        document.getElementById('confirmGender').textContent = genderText;
        document.getElementById('confirmBirthday').textContent = formattedBirthday;
        document.getElementById('confirmAddress').textContent = address;
    });

    // Xử lý khi nhấn nút "Xác nhận đặt lịch" trong modal
    document.getElementById('confirmSubmit').addEventListener('click', function () {
        // Gửi form
        document.getElementById('bookingForm').submit();
    });

    // Kiểm tra khi chọn giờ hẹn không được đặt ở quá khứ
    document.getElementById("bookingForm").addEventListener("submit", function(event) {
        const bookingDate = appointmentDatePicker.input.value;
        const appointmentTime = appointmentTimePicker.input.value;

        if (bookingDate && appointmentTime) {
            // Chuyển đổi định dạng ngày từ d/m/Y sang yyyy-MM-dd để tạo đối tượng Date chính xác
            const [day, month, year] = bookingDate.split('/');
            const selectedDateTime = new Date(`${year}-${month}-${day}T${appointmentTime}`);
            const now = new Date();

            if (selectedDateTime < now) {
                event.preventDefault();
                alert("Giờ hẹn không được đặt ở quá khứ.");
            }
        }
    });
});
