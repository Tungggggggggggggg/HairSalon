document.addEventListener('DOMContentLoaded', function() {
    const salaryTable = new simpleDatatables.DataTable("#salaryTable", {
        perPageSelect: false,
        searchable: true,
        fixedHeight: true,
        perPage: 10,
        labels: {
            placeholder: "Tìm kiếm...",
            noRows: "Không có dữ liệu",
            info: "Hiển thị {start} đến {end} của {rows} lương",
            pagination: {
                previous: "Trước",
                next: "Tiếp theo"
            }
        },
    });
});

// Hàm mở modal thêm/sửa lương
function openSalaryModal(type, salaryId = '', staffId = '', staffName = '', baseSalary = '', bonus = '', status = '') {
    const modalTitle = document.getElementById('salaryModalLabel');
    const salaryForm = document.getElementById('salaryForm');
    const staffSelect = document.getElementById('staffSelect');
    const staffNameInput = document.getElementById('staffName');
    const staffIdHidden = document.getElementById('staffIdHidden');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới lương';
        salaryForm.reset();
        document.getElementById('salaryId').value = '';
        staffSelect.style.display = 'block';
        staffSelect.setAttribute('name', 'staff.id');
        staffNameInput.style.display = 'none';
        staffNameInput.removeAttribute('name');
        staffIdHidden.removeAttribute('name');
        staffIdHidden.value = '';
    } else if (type === 'add' || type === 'edit') {
        modalTitle.textContent = type === 'add' ? 'Thêm lương cho nhân viên' : 'Sửa lương';
        salaryForm.reset();
        document.getElementById('salaryId').value = salaryId;
        staffSelect.style.display = 'none';
        staffSelect.removeAttribute('name');
        staffNameInput.style.display = 'block';
        staffNameInput.value = staffName;
        staffIdHidden.setAttribute('name', 'staff.id');
        staffIdHidden.value = staffId;

        // Thiết lập giá trị mặc định
        document.getElementById('baseSalary').value = baseSalary || 0;
        document.getElementById('bonus').value = bonus || 0;
        document.getElementById('salaryStatus').value = status || 'ChuaThanhToan';
    }
}

// Hàm xem lịch sử lương
function viewSalaryHistory(staffId, staffName) {
    // Gửi yêu cầu lấy lịch sử lương cho nhân viên
    fetch(`/admin/salary_management/history/${staffId}`)
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Không thể lấy lịch sử lương.');
        }
    })
    .then(data => {
        const historyTableBody = document.getElementById('historyTableBody');
        historyTableBody.innerHTML = '';
        data.forEach(salary => {
            const row = document.createElement('tr');

            const baseSalaryCell = document.createElement('td');
            baseSalaryCell.textContent = parseFloat(salary.baseSalary).toLocaleString('vi-VN');
            row.appendChild(baseSalaryCell);

            const bonusCell = document.createElement('td');
            bonusCell.textContent = parseFloat(salary.bonus).toLocaleString('vi-VN');
            row.appendChild(bonusCell);

            const statusCell = document.createElement('td');
            statusCell.textContent = salary.status === 'DaThanhToan' ? 'Đã thanh toán' : 'Chưa thanh toán';
            row.appendChild(statusCell);

            const updateDateCell = document.createElement('td');
            updateDateCell.textContent = salary.formattedCreateDate;
            row.appendChild(updateDateCell);

            historyTableBody.appendChild(row);
        });
        // Hiển thị modal lịch sử lương
        const historyModal = new bootstrap.Modal(document.getElementById('historyModal'));
        document.getElementById('historyStaffName').textContent = staffName;
        historyModal.show();
    })
    .catch(error => {
        console.error('Error fetching salary history:', error);
        alert('Có lỗi xảy ra khi lấy lịch sử lương. Vui lòng thử lại.');
    });
}

// Hàm mở modal xóa lương
function openDeleteModal(salaryId, staffName) {
    const deleteSalaryModal = new bootstrap.Modal(document.getElementById('deleteSalaryModal'));
    document.getElementById('deleteSalaryId').value = salaryId;
    document.getElementById('deleteSalaryStaffName').textContent = staffName;
    deleteSalaryModal.show();
}