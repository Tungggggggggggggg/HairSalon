$(document).ready(function() {
    // Khởi tạo FullCalendar
    initializeCalendar();
    // Khởi tạo datepicker
    initializeDatePicker();
    // Tính năng kéo thả cho sự kiện
    initializeDraggableEvents();
    // Kiểm tra sự kiện ban đầu
    checkAppointments();
});

function initializeCalendar() {
    $('#calendar').fullCalendar({
        editable: true,
        events: [
            {
                title: 'Làm việc',
                start: '2024-10-10',
            },
            {
                title: 'Làm việc',
                start: '2024-10-12',
            }
        ],
        eventRender: function(event, element) {
            element.addClass('event');
            element.attr('draggable', 'true');
        },
        eventDrop: function(event, delta, revertFunc) {
            console.log("Sự kiện đã được kéo thả:", event);
        },
        eventRemove: function(event) {
            checkAppointments(); // Kiểm tra lịch hẹn sau khi xóa
        }
    });
}

function initializeDatePicker() {
    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
}

function initializeDraggableEvents() {
    interact('.event').draggable({
        listeners: {
            move(event) {
                const target = event.target;
                const x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx;
                const y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

                target.style.transform = `translate(${x}px, ${y}px)`;
                target.setAttribute('data-x', x);
                target.setAttribute('data-y', y);
            }
        }
    });
}

function updateStatus(button) {
    const row = button.closest('tr');
    const statusCell = row.querySelector('.status');
    const currentStatus = statusCell.textContent.trim();

    // Chỉ cho phép cập nhật trạng thái nếu chưa hoàn thành
    if (currentStatus === "Đã hoàn thành") {
        alert("Đơn hàng đã hoàn thành không thể thay đổi trạng thái!");
        return;
    }

    // Cập nhật trạng thái
    statusCell.textContent = (currentStatus === "Đang xử lý") ? "Đã hoàn thành" : "Đang xử lý";
}

function acceptOrder(button) {
    const row = button.closest('tr');
    const customerName = row.cells[1].textContent;
    const requestId = row.cells[0].textContent;
    const service = row.cells[2].textContent;

    // Hiển thị hộp thoại chọn thời gian
    $("#timePickerDialog").dialog({
        modal: true,
        buttons: {
            "Xác nhận": function() {
                const selectedDate = $("#orderDate").val();
                const selectedTime = $("#orderTime").val();
                const eventDateTime = moment(`${selectedDate} ${selectedTime}`).format();

                // Thêm sự kiện vào lịch
                $('#calendar').fullCalendar('renderEvent', {
                    title: `Đơn hàng từ ${customerName} (Mã: ${requestId}, Dịch vụ: ${service})`,
                    start: eventDateTime,
                    allDay: false
                }, true);

                row.remove(); // Xóa hàng đã nhận đơn
                $(this).dialog("close"); // Đóng hộp thoại
            },
            "Hủy": function() {
                $(this).dialog("close"); // Đóng hộp thoại
            }
        }
    });
}

function cancelOrder(button) {
    const row = button.closest('tr');
    const statusCell = row.querySelector('.status');
    const currentStatus = statusCell.textContent;

    // Chỉ cho phép hủy nếu trạng thái không phải là "Đã hoàn thành"
    if (currentStatus === "Đã hoàn thành") {
        alert("Đơn hàng đã hoàn thành không thể hủy!");
        return;
    }

    // Cập nhật trạng thái đơn hàng thành "Đã hủy"
    statusCell.textContent = "Đã hủy";
}

function filterTable() {
    const searchInput = document.getElementById("searchInput").value.toLowerCase();
    const statusFilter = document.getElementById("statusFilter").value;
    const rows = document.querySelectorAll("#requestTableBody tr");

    rows.forEach(row => {
        const customerName = row.cells[1].textContent.toLowerCase();
        const status = row.querySelector('.status').textContent;

        const matchesSearch = customerName.includes(searchInput);
        const matchesStatus = statusFilter === "" || status === statusFilter;

        row.style.display = (matchesSearch && matchesStatus) ? "" : "none"; // Hiện hoặc ẩn hàng
    });
}

function checkAppointments() {
    const events = $('#calendar').fullCalendar('clientEvents');
    const notification = $('.notification');

    // Lọc ra các lịch hẹn
    const appointmentEvents = events.filter(event => event.title === 'Lịch hẹn');

    // Lấy tất cả trạng thái từ bảng
    const rows = document.querySelectorAll("#requestTableBody tr");
    let hasActiveAppointments = false;

    rows.forEach(row => {
        const status = row.querySelector('.status').textContent.trim();
        if (status === "Đang xử lý") {
            hasActiveAppointments = true; // Có ít nhất một lịch hẹn đang xử lý
        }
    });

    // Kiểm tra các lịch hẹn
    if (appointmentEvents.length === 0 || !hasActiveAppointments) {
        notification.html('<strong>Hiện không có lịch hẹn mới!</strong>');
    } else {
        notification.html('<strong>Thông báo: Có lịch hẹn mới!</strong>');
    }
}