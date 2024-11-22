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

function openServiceModal(type, id = '', name = '', description = '', price = '', duration = '',) {
    const modalTitle = document.getElementById('serviceModalLabel');
    const serviceId = document.getElementById('serviceId');
    const serviceNameInput = document.getElementById('serviceName');
    const serviceDescription = document.getElementById('serviceDescription');
    const servicePriceInput = document.getElementById('servicePrice');
    const serviceDurationInput = document.getElementById('serviceDurationMinutes');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới dịch vụ';
        serviceId.value = '';
        serviceNameInput.value = '';
        serviceDescription.value = '';
        servicePriceInput.value = '';
        serviceDurationInput.value = '';

    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa dịch vụ';
        serviceId.value = id;
        serviceNameInput.value = name;
        serviceDescription.value = description;
        servicePriceInput.value = price;
        serviceDurationInput.value = duration;

    }

    // serviceModal = new bootstrap.Modal(document.getElementById('serviceModal'));
    // serviceModal.show();
}

function openDeleteModal(id, name) {
    document.getElementById("deleteServiceId").value = id;
    document.getElementById("deleteServiceName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteServiceModal')).show();
}


function viewDetails(id, name, description, price, durationMinutes) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailName").textContent = name;
    document.getElementById("detailName1").textContent = name;
    document.getElementById("detailDescription").textContent = description;
    document.getElementById("detailPrice").textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
    document.getElementById("detailDurationMinutes").textContent = durationMinutes + " phút";
}
