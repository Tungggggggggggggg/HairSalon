document.addEventListener("DOMContentLoaded", function () {
    // Khởi tạo Flatpickr cho trường ngày hẹn chỉ với định dạng ngày, ngôn ngữ tiếng Việt
    flatpickr("#appointmentDate", {
        dateFormat: "d/m/Y",
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
                
                // Cập nhật Timepicker với minTime là giờ hiện tại
                $("#appointmentTime").timepicker("option", "minTime", minTime);
            } else {
                // Nếu là ngày khác, đặt minTime là giờ mở cửa (ví dụ: 08:00)
                $("#appointmentTime").timepicker("option", "minTime", "08:00");
            }
        }
    });

    // Khởi tạo jQuery Timepicker cho trường giờ hẹn
    $("#appointmentTime").timepicker({
        timeFormat: "HH:mm",
        interval: 30,
        minTime: "08:00",
        maxTime: "20:00",
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });

    // Khởi tạo Flatpickr cho trường ngày sinh với định dạng ngày và ngôn ngữ tiếng Việt
    flatpickr("#dateOfBirth", {
        dateFormat: "d/m/Y",
        maxDate: "today",
        locale: "vi"
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

    // Hiệu ứng mượt cho nút xác nhận đặt lịch
    const submitButton = document.querySelector(".submit-button");
    submitButton.addEventListener("click", function (event) {
        event.preventDefault();
        if (confirm("Bạn có chắc chắn muốn đặt lịch không?")) {
            window.scrollTo({ top: 0, behavior: "smooth" });
            setTimeout(() => {
                alert("Đặt lịch thành công!");
                document.getElementById("appointmentForm").submit();
            }, 500);
        }
    });
});
