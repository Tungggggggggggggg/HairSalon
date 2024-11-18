document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: '/staff/bookings/events',
        locale: 'vi',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        eventClick: function(info) {
            var eventObj = info.event;

            // Lấy thông tin từ extendedProps
            var customerName = eventObj.extendedProps.customerName || '';
            var status = eventObj.extendedProps.status || '';

            document.getElementById('eventTitle').textContent = eventObj.title;
            document.getElementById('eventCustomer').textContent = customerName;
            document.getElementById('eventAppointmentTime').textContent = eventObj.start ? eventObj.start.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'}) : '';
            document.getElementById('eventStatus').textContent = status;

            // Hiển thị modal chi tiết
            var eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
            eventModal.show();
        }
    });

    calendar.render();
});