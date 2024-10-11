function viewRequest(requestId) {
  // Giả lập thông tin yêu cầu (thay thế bằng dữ liệu thực tế từ backend)
  const requests = {
    1: {
      name: "Nguyen Van A",
      email: "nguyenvana@example.com",
      description: "Không thể đăng nhập vào tài khoản.",
      status: "Chưa giải quyết",
    },
    2: {
      name: "Tran Thi B",
      email: "tranthib@example.com",
      description: "Cần trợ giúp về đơn hàng.",
      status: "Đang xử lý",
    },
  };

  const request = requests[requestId];

  // Kiểm tra xem yêu cầu có tồn tại không
  if (!request) {
    alert("Yêu cầu không tồn tại!");
    return;
  }

  document.getElementById("request-info").innerHTML = `
        <strong>Tên:</strong> ${request.name}<br>
        <strong>Email:</strong> ${request.email}<br>
        <strong>Sự miêu tả:</strong> ${request.description}<br>
        <strong>Trạng thái:</strong> <span class="status ${request.status}">${
    request.status.charAt(0).toUpperCase() + request.status.slice(1)
  }</span>
    `;

  document.getElementById("request-detail").classList.remove("hidden");
}

document.getElementById("update-button").addEventListener("click", function () {
  const selectedStatus = document.getElementById("update-status").value;
  alert(`Trạng thái đã được cập nhật thành: ${selectedStatus}`);
  // Thêm mã để cập nhật trạng thái thực tế ở đây
});

document.getElementById("send-response").addEventListener("click", function () {
  const responseMessage = document.getElementById("response-message").value;
  if (responseMessage.trim() === "") {
    alert("Vui lòng nhập phản hồi trước khi gửi.");
    return;
  }
  alert(`Phản hồi đã được gửi: ${responseMessage}`);
  document.getElementById("response-message").value = ""; // Xóa tin nhắn sau khi gửi
});
