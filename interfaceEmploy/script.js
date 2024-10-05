document.getElementById('updateForm').addEventListener('submit', function (e) {
    e.preventDefault(); // Prevent form submission

    const date = document.getElementById('date').value;
    const time = document.getElementById('time').value;
    const service = document.getElementById('service').value;

    const table = document.querySelector('tbody');
    const newRow = document.createElement('tr');

    newRow.innerHTML = `
        <td>${date}</td>
        <td>${time}</td>
        <td>${service}</td>
        <td>Chưa xác nhận</td>
        <td><button class="edit">Chỉnh sửa</button></td>
    `;

    table.appendChild(newRow);
    this.reset(); // Reset the form fields
});