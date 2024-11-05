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
        serviceInput.value = '';
        staffInput.value = '';
        statusInput.value = '';
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

function openDeleteModal(id, name) {
    document.getElementById("deleteId").value = id;
    document.getElementById("deleteName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteModal')).show();
}


function viewDetails(id, name, nameStaff, service, date, satrtTime, endTime, status) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailUser").textContent = name;
    document.getElementById("detailService").textContent = nameStaff;
    document.getElementById("detailStaff").textContent = service;
    document.getElementById("detailDate").textContent = date;
    document.getElementById("detailStartTime").textContent = satrtTime;
    document.getElementById("detailEndTime").textContent = endTime;
    document.getElementById("detailStatus").textContent = status;
}