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
            next: "Tiếp theo"
        }
    }
});

let bookingModal;

function openModal(type, id = '', customerName = '', bookingDateTime = '', service = '', staff = '', status = '') {
    const modalTitle = document.getElementById('bookingModalLabel');
    const bookingId = document.getElementById('bookingId');
    const customerNameInput = document.getElementById('customerName');
    const bookingDateTimeInput = document.getElementById('bookingDateTime');
    const serviceInput = document.getElementById('service');
    const staffInput = document.getElementById('staff');
    const statusInput = document.getElementById('status');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới lịch hẹn';
        bookingId.value = '';
        customerNameInput.value = '';
        bookingDateTimeInput.value = '';
        serviceInput.value = 'Cắt tóc';
        staffInput.value = '';
        statusInput.value = 'Chưa xác nhận';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa lịch hẹn';
        bookingId.value = id;
        customerNameInput.value = customerName;
        bookingDateTimeInput.value = bookingDateTime;
        serviceInput.value = service;
        staffInput.value = staff;
        statusInput.value = status;
    }

    bookingModal = new bootstrap.Modal(document.getElementById('bookingModal'));
    bookingModal.show();
}

function changeStatus(element) {
    const currentStatus = element.getAttribute('data-status');
    const id = element.getAttribute('data-id');

    if (currentStatus === 'Chưa xác nhận') {
        // Hiển thị lựa chọn để thay đổi trạng thái
        const newStatus = prompt('Thay đổi trạng thái thành:\n1. Đã xác nhận\n2. Đã hủy');
        if (newStatus === '1') {
            element.classList.remove('bg-secondary');
            element.classList.add('bg-success');
            element.textContent = 'Đã xác nhận';
            element.setAttribute('data-status', 'Đã xác nhận');
        } else if (newStatus === '2') {
            element.classList.remove('bg-secondary');
            element.classList.add('bg-danger');
            element.textContent = 'Đã hủy';
            element.setAttribute('data-status', 'Đã hủy');
        }
    }
}