const salaryTable = new simpleDatatables.DataTable("#salaryTable", {
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

let salaryModal;

function openSalaryModal(type, id = '', staffId = '', baseSalary = '', bonus = '') {
    const modalTitle = document.getElementById('salaryModalLabel');
    const salaryId = document.getElementById('salaryId');
    const staffNameInput = document.getElementById('staffName');
    const baseSalaryInput = document.getElementById('baseSalary');
    const bonusInput = document.getElementById('bonus');

    if (type === 'new') {
        modalTitle.textContent = 'Thêm mới lương';
        salaryId.value = '';
        staffNameInput.value = ''; // Clear the dropdown for new entry
        baseSalaryInput.value = '';
        bonusInput.value = '';
    } else if (type === 'edit') {
        modalTitle.textContent = 'Chỉnh sửa lương';
        salaryId.value = id;
        staffNameInput.value = staffId; // Set the selected staff ID
        baseSalaryInput.value = baseSalary;
        bonusInput.value = bonus;
    }

    // Hiển thị modal
    const salaryModal = new bootstrap.Modal(document.getElementById('salaryModal'));
    salaryModal.show();
}

// Mở modal lịch sử lương
function openHistoryModal(name) {
    const historyModalLabel = document.getElementById('historyModalLabel');
    historyModalLabel.textContent = `Lịch sử lương của ${name}`;

    const historyTableBody = document.getElementById('historyTableBody');
    historyTableBody.innerHTML = `
        <tr>
            <td>09/2024</td>
            <td>5,000,000</td>
            <td>500,000</td>
            <td>5,500,000</td>
        </tr>
        <tr>
            <td>08/2024</td>
            <td>5,000,000</td>
            <td>300,000</td>
            <td>5,300,000</td>
        </tr>
    `;

    const historyModal = new bootstrap.Modal(document.getElementById('historyModal'));
    historyModal.show();
}

// Xuất dữ liệu lương ra file Excel (bỏ cột "Hành động")
function exportSalaryToExcel() {
    const table = document.getElementById('salaryTable');
    const clonedTable = table.cloneNode(true);
    const actionColumnIndex = 5; // Chỉ mục của cột "Hành động"

    // Loại bỏ cột "Hành động" khỏi tất cả hàng
    for (let row of clonedTable.rows) {
        if (row.cells.length > actionColumnIndex) {
            row.deleteCell(actionColumnIndex);
        }
    }

    const wb = XLSX.utils.table_to_book(clonedTable, { sheet: "Lương nhân viên" });
    XLSX.writeFile(wb, 'Luong_nhan_vien.xlsx');
}
