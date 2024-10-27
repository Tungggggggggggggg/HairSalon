const serviceTable = new simpleDatatables.DataTable("#serviceTable", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} dịch vụ",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    }
});

let serviceModal;

function openServiceModal(type, id = '', name = '', price = '', duration = '') {
    const modalTitle = document.getElementById('serviceModalLabel');
    const serviceId = document.getElementById('serviceId');
    const serviceNameInput = document.getElementById('serviceName');
    const servicePriceInput = document.getElementById('servicePrice');
    const serviceDurationInput = document.getElementById('serviceDuration');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới dịch vụ';
        serviceId.value = '';
        serviceNameInput.value = '';
        servicePriceInput.value = '';
        serviceDurationInput.value = '';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa dịch vụ';
        serviceId.value = id;
        serviceNameInput.value = name;
        servicePriceInput.value = price;
        serviceDurationInput.value = duration;
    }

    serviceModal = new bootstrap.Modal(document.getElementById('serviceModal'));
    serviceModal.show();
}