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

// Biến để lưu Flatpickr instance cho ngày sinh
let staffBirthdayPicker;

// Khởi tạo Flatpickr cho trường "Ngày sinh"
staffBirthdayPicker = flatpickr("#staffBirthday", {
    dateFormat: "d/m/Y", // Định dạng ngày: dd/MM/yyyy
    maxDate: "today", // Ngày sinh không thể chọn trong tương lai
    locale: "vi",
    defaultDate: null
});

let staffModal;

// Hàm openModal để thêm/sửa nhân viên
function openModal(type, id = '', avatar = '', name = '', email = '', password = '', phone = '', address = '', gender = '', birthday = '', experience = '', role = '') {
    const modalTitle = document.getElementById('staffModalLabel');
    const staffId = document.getElementById('staffId');
    const staffNameInput = document.getElementById('staffName');
    const staffEmailInput = document.getElementById('staffEmail');
    const staffPassword = document.getElementById('staffPassword');
    const staffPhone = document.getElementById('staffPhone');
    const staffAddress = document.getElementById('staffAddress');
    const staffGender = document.getElementById('staffGender');
    const staffExperience = document.getElementById('staffExperience');
    const staffRole = document.getElementById('staffRole');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới nhân viên';
        staffId.value = '';
        staffNameInput.value = '';
        staffEmailInput.value = '';
        staffPassword.value = '';
        staffPhoneInput.value = '';
        staffAddressInput.value = '';
        staffGender.value = '';
        staffBirthdayPicker.clear();
        staffExperience.value = '';
        staffRole.value = 'NhanVien';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa nhân viên';
        staffId.value = id;
        staffNameInput.value = name;
        staffEmailInput.value = email;
        staffPassword.value = password;
        staffPhone.value = phone;
        staffAddress.value = address;
        staffGender.value = gender;
        staffBirthdayPicker.setDate(birthday, true, "d/m/Y");
        staffExperience.value = experience;
        staffRole.value = role;
    }

    // const staffModal = new bootstrap.Modal(document.getElementById('staffModal'));
    // staffModal.show();
}

function openDeleteModal(id, name) {
    document.getElementById("deleteStaffId").value = id;
    document.getElementById("deleteStaffName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteStaffModal')).show();
}


function viewDetails(id, name, email, password, phone, address, gender, birthday, experience, role, ) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailName").textContent = name;
    document.getElementById("detailEmail").textContent = email;
    document.getElementById("detailPassword").textContent = password;
    document.getElementById("detailPhone").textContent = phone;
    document.getElementById("detailAddress").textContent = address;
    document.getElementById("detailGender").textContent = gender;
    document.getElementById("detailBirthday").textContent = birthday;
    document.getElementById("detailExperience").textContent = experience;
    document.getElementById("detailRole").textContent = role;

}