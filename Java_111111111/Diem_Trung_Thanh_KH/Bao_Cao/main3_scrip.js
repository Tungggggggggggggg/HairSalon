// Xử lý sự kiện khi form được gửi
document
  .getElementById("report-form")
  .addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn không cho trang tải lại

    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const description = document.getElementById("description").value;

    // Hiện thông báo cho khách hàng sau khi gửi báo cáo
    alert(
      `Thank you, ${name}! Your report has been submitted. We will contact you at ${email} shortly.`
    );

    // Xóa nội dung form sau khi gửi
    document.getElementById("report-form").reset();
  });
