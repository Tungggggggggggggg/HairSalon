document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    let currentEvent;

    if (calendarEl) {
        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'vi',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek,timeGridDay'
            },
            events: [
                { 
                    title: 'Cắt tóc', 
                    start: '2024-10-25T09:00:00', 
                    end: '2024-10-25T10:00:00', 
                    customer: 'Khách hàng 1',
                    status: 'Chưa hoàn thành',
                    description: 'Cắt tóc', 
                    color: 'green' 
                },
                { 
                    title: 'Gội đầu', 
                    start: '2024-10-26T14:00:00', 
                    end: '2024-10-26T15:30:00', 
                    customer: 'Khách hàng 2',
                    status: 'Chưa hoàn thành',
                    description: 'Cắt tóc', 
                    color: 'orange' 
                }
            ],
            displayEventTime: true,
            eventTimeFormat: {
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            },
            eventClick: function(info) {
                currentEvent = info.event;
                document.getElementById('eventTitle').textContent = currentEvent.title;
                document.getElementById('eventCustomer').textContent = currentEvent.extendedProps.customer;
                document.getElementById('eventStart').textContent = currentEvent.start.toLocaleString();
                document.getElementById('eventEnd').textContent = currentEvent.end ? currentEvent.end.toLocaleString() : 'Không có';
                document.getElementById('eventStatus').textContent = currentEvent.extendedProps.status;
                document.getElementById('eventDescription').textContent = currentEvent.extendedProps.description;

                const eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
                eventModal.show();
            }
        });
        calendar.render();
    } else {
        console.error('Không tìm thấy phần tử với ID "calendar".');
    }

    document.getElementById('btnComplete').addEventListener('click', function() {
        if (currentEvent) {
            currentEvent.setExtendedProp('status', 'Hoàn thành');
            document.getElementById('eventStatus').textContent = 'Hoàn thành';
        }
    });

    document.getElementById('btnIncomplete').addEventListener('click', function() {
        if (currentEvent) {
            currentEvent.setExtendedProp('status', 'Chưa hoàn thành');
            document.getElementById('eventStatus').textContent = 'Chưa hoàn thành';
        }
    });
});

const monthlySalaryTable = new simpleDatatables.DataTable("#monthlySalaryTable", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} lương",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    }
});