const staffTable = new simpleDatatables.DataTable("#staffTable", {
    perPageSelect: false,
    searchable: true,
    fixedHeight: true,
    labels: {
        placeholder: "Tìm kiếm...",
        noRows: "Không có dữ liệu",
        info: "Hiển thị {start} đến {end} của {rows} nhân viên",
        pagination: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    }
});

let staffModal;

function openStaffModal(type, id = '', name = '', email = '', phone = '') {
    const modalTitle = document.getElementById('staffModalLabel');
    const staffId = document.getElementById('staffId');
    const staffNameInput = document.getElementById('staffName');
    const staffEmailInput = document.getElementById('staffEmail');
    const staffPhoneInput = document.getElementById('staffPhone');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới nhân viên';
        staffId.value = '';
        staffNameInput.value = '';
        staffEmailInput.value = '';
        staffPhoneInput.value = '';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa nhân viên';
        staffId.value = id;
        staffNameInput.value = name;
        staffEmailInput.value = email;
        staffPhoneInput.value = phone;
    }

    staffModal = new bootstrap.Modal(document.getElementById('staffModal'));
    staffModal.show();
}