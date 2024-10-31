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

function openModal(type, id = '', name = '', email = '', password = '', phone = '', address = '', gender = '', birthday = '', experience = '', specialty = '', status = '', role = '') {
    const modalTitle = document.getElementById('staffModalLabel');
    const staffId = document.getElementById('staffId');
    const staffNameInput = document.getElementById('staffName');
    const staffEmailInput = document.getElementById('staffEmail');
    const staffPassword = document.getElementById('staffPassword');
    const staffPhone = document.getElementById('staffPhone');
    const staffAddress = document.getElementById('staffAddress');
    const staffGender = document.getElementById('staffGender');
    const staffBirthday = document.getElementById('staffBirthday');
    const staffExperience = document.getElementById('staffExperience');
    const staffSpecialty = document.getElementById('staffSpecialty');
    const staffStatus = document.getElementById('staffStatus');
    const staffRole = document.getElementById('staffRole');


    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới nhân viên';
        staffId.value = '';
        staffNameInput.value = '';
        staffEmailInput.value = '';
        staffPassword.value = '';
        staffPhone.value = '';
        staffAddress.value = '';
        staffGender.value = '';
        staffBirthday.value = '';
        staffExperience.value = '';
        staffSpecialty.value = '';
        staffStatus.value = '';
        staffRole.value = '';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa nhân viên';
        staffId.value = id;
        staffNameInput.value = name;
        staffEmailInput.value = email;
        staffPassword.value = password;
        staffPhone.value = phone;
        staffAddress.value = address;
        staffGender.value = gender;
        staffBirthday.value = birthday;
        staffExperience.value = experience;
        staffSpecialty.value = specialty;
        staffStatus.value = status;
        staffRole.value = role;
    }

    // staffModal = new bootstrap.Modal(document.getElementById('staffModal'));
    // staffModal.show();
}

function openDeleteModal(id, name) {
    document.getElementById("deleteStaffId").value = id;
    document.getElementById("deleteStaffName").innerText = name;
    new bootstrap.Modal(document.getElementById('deleteStaffModal')).show();
}


function viewDetails(id, name, email, password, phone, address, gender, birthday, experience, specialty, status, role, createdDate) {
    document.getElementById("detailId").textContent = id;
    document.getElementById("detailName").textContent = name;
    document.getElementById("detailEmail").textContent = email;
    document.getElementById("detailPassword").textContent = password;
    document.getElementById("detailPhone").textContent = phone;
    document.getElementById("detailAddress").textContent = address;
    document.getElementById("detailGender").textContent = gender;
    document.getElementById("detailBirthday").textContent = birthday;
    document.getElementById("detailExperience").textContent = experience;
    document.getElementById("detailSpecialty").textContent = specialty;
    document.getElementById("detailStatus").textContent = status;
    document.getElementById("detailRole").textContent = role;
    document.getElementById("detailCreatedDate").textContent = createdDate;
}