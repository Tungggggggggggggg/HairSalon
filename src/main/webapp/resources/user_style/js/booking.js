document.addEventListener("DOMContentLoaded", function () {

    const hiddenInput = document.getElementById('selected-staff-id');

    // Khai báo biến để lưu tên nhân viên được chọn
    let staffName = 'Không có';

    // Khởi tạo Flatpickr cho trường ngày hẹn với định dạng dd/MM/yyyy, ngôn ngữ tiếng Việt
    const appointmentDatePicker = flatpickr("#appointmentDate", {
        dateFormat: "d/m/Y", // dd/MM/yyyy
        minDate: "today",
        locale: "vi",
        onChange: function (selectedDates, dateStr, instance) {
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
        maxTime: "21:00",
        onChange: function(selectedDates, dateStr, instance) {
            // Gọi hàm cập nhật danh sách nhân viên
            fetchAvailableStaff();
        }
    });

    // Thêm sự kiện khi thay đổi dịch vụ
    document.getElementById("serviceType").addEventListener("change", fetchAvailableStaff);

    function fetchAvailableStaff() {
        const date = document.getElementById("appointmentDate").value;
        const time = document.getElementById("appointmentTime").value;

        // Lấy danh sách dịch vụ đã chọn
        const serviceSelect = document.getElementById("serviceType");
        const selectedServices = Array.from(serviceSelect.selectedOptions).map(option => option.value);

        if (date && time) {
            // Gửi yêu cầu AJAX tới server
            $.ajax({
                url: '/booking/available_staff',
                type: 'GET',
                traditional: true,
                data: {
                    date: date,
                    time: time,
                    services: selectedServices
                },
                success: function(data) {
                    // Cập nhật danh sách nhân viên
                    const staffListContainer = document.getElementById("staff-list");
                    const selectedStaffId = hiddenInput.value; // Lưu lại lựa chọn hiện tại

                    // Xóa các thẻ nhân viên cũ
                    staffListContainer.innerHTML = '';

                    if (data.length === 0) {
                        staffListContainer.innerHTML = '<p>Không có nhân viên khả dụng vào thời gian này.</p>';
                        return;
                    }

                    data.forEach(function(staff) {
                        const staffCard = document.createElement('div');
                        staffCard.className = 'staff-card';
                        staffCard.dataset.staffId = staff.id;
                        staffCard.dataset.name = staff.name;
                        staffCard.style.cssText = 'flex: 0 0 calc(50% - 10px); text-align: center; cursor: pointer; border: 2px solid transparent; border-radius: 10px; padding: 10px; position: relative; box-sizing: border-box;';

                        const checkIcon = document.createElement('div');
                        checkIcon.className = 'check-icon';
                        checkIcon.style.cssText = 'display: none; position: absolute; top: 5px; right: 5px; background: #007bff; color: white; border-radius: 50%; width: 20px; height: 20px; font-size: 14px; text-align: center; line-height: 20px;';
                        checkIcon.textContent = '✓';

                        const img = document.createElement('img');
                        img.src = '/user_style/images/' + staff.avatar;
                        img.alt = staff.name;
                        img.style.cssText = 'width: 200px; height: 200px; border-radius: 10px; object-fit: cover; margin-bottom: 10px;';

                        const p = document.createElement('p');
                        p.style.cssText = 'margin: 0; font-size: 14px; font-weight: bold;';
                        p.textContent = staff.name;

                        staffCard.appendChild(checkIcon);
                        staffCard.appendChild(img);
                        staffCard.appendChild(p);

                        // Kiểm tra nếu nhân viên đang được chọn
                        if (staff.id == selectedStaffId) {
                            staffCard.style.border = '2px solid #007bff';
                            checkIcon.style.display = 'block';
                        }

                        // Thêm sự kiện click cho staffCard
                        staffCard.addEventListener('click', function () {
                            // Bỏ chọn tất cả nhân viên
                            document.querySelectorAll('.staff-card').forEach(c => {
                                c.style.border = '2px solid transparent';
                                c.querySelector('.check-icon').style.display = 'none';
                            });

                            // Đánh dấu nhân viên được chọn
                            staffCard.style.border = '2px solid #007bff';
                            checkIcon.style.display = 'block';

                            // Lưu ID của nhân viên được chọn
                            const staffId = staffCard.getAttribute('data-staff-id');
                            hiddenInput.value = staffId;

                            // Lưu tên nhân viên được chọn
                            staffName = staffCard.getAttribute('data-name');
                        });

                        staffListContainer.appendChild(staffCard);
                    });

                    // Cập nhật các nút điều hướng nếu cần
                    updateScrollButtons();
                }
            });
        }
    }

    // Hiển thị hoặc ẩn nút điều hướng
    function updateScrollButtons() {
        const staffList = document.getElementById('staff-list');
        const staffCards = staffList.querySelectorAll('.staff-card');
        const scrollLeftBtn = document.getElementById('scroll-left');
        const scrollRightBtn = document.getElementById('scroll-right');

        // Số lượng nhân viên hiển thị mỗi lần
        const visibleStaffCount = 2;
        const cardWidth = staffCards[0]?.offsetWidth + 15 || 0; // Chiều rộng card + khoảng cách giữa các card
        let scrollPosition = 0;

        // Hiển thị hoặc ẩn nút điều hướng
        function updateButtons() {
            scrollLeftBtn.style.display = scrollPosition > 0 ? 'block' : 'none';
            scrollRightBtn.style.display = (scrollPosition + visibleStaffCount) < staffCards.length ? 'block' : 'none';
        }

        // Xử lý sự kiện bấm nút trái
        scrollLeftBtn.onclick = function(event) {
            event.stopPropagation();
            scrollPosition = Math.max(0, scrollPosition - visibleStaffCount);
            staffList.scrollTo({ left: scrollPosition * cardWidth, behavior: 'smooth' });
            updateButtons();
        };

        // Xử lý sự kiện bấm nút phải
        scrollRightBtn.onclick = function(event) {
            event.stopPropagation();
            scrollPosition = Math.min(staffCards.length - visibleStaffCount, scrollPosition + visibleStaffCount);
            staffList.scrollTo({ left: scrollPosition * cardWidth, behavior: 'smooth' });
            updateButtons();
        };

        updateButtons();
    }

    // Gọi fetchAvailableStaff khi trang được tải
    fetchAvailableStaff();

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
        const staffId = hiddenInput.value;
        staffName = 'Không có';
        if (staffId) {
            const staffCard = document.querySelector(`.staff-card[data-staff-id="${staffId}"]`);
            if (staffCard) {
                staffName = staffCard.getAttribute('data-name');
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
        let formattedBirthday = 'Không có';
        if (birthday && birthday.includes('/')) {
            const [day, month, year] = birthday.split('/');
            formattedBirthday = `${day}/${month}/${year}`;
        }

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
    document.getElementById("bookingForm").addEventListener("submit", function (event) {
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





