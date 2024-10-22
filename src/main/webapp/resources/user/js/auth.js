// Hiển thị modal với hiệu ứng mượt mà
function showModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "block";
    setTimeout(() => {
        modal.classList.add("show");
    }, 10);

    // Đặt tab mặc định khi mở modal Đăng nhập
    if (modalId === "loginModal") {
        switchToEmailLogin();
    }
}

// Đóng modal với hiệu ứng mượt mà
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.classList.remove("show");
    setTimeout(() => {
        modal.style.display = "none";
    }, 500);
}

// Chuyển sang đăng nhập bằng Email
function switchToEmailLogin() {
    document.getElementById("loginEmail").style.display = "block";
    document.getElementById("loginPhone").style.display = "none";
    document.getElementById("emailTab").classList.add("active");
    document.getElementById("phoneTab").classList.remove("active");
}

// Chuyển sang đăng nhập bằng Số Điện Thoại
function switchToPhoneLogin() {
    document.getElementById("loginEmail").style.display = "none";
    document.getElementById("loginPhone").style.display = "block";
    document.getElementById("phoneTab").classList.add("active");
    document.getElementById("emailTab").classList.remove("active");
}

// Kiểm tra mật khẩu khi đăng ký
function validatePassword(event) {
    event.preventDefault();
    const password = document.getElementById("regPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const errorMessage = document.getElementById("passwordErrorMessage");

    if (password !== confirmPassword) {
        errorMessage.textContent = "Mật khẩu không khớp. Vui lòng nhập lại.";
    } else {
        errorMessage.textContent = "";
        alert("Đăng ký thành công!");
    }
}

// Hiển thị thông báo Quên mật khẩu
function showForgotPasswordModal() {
    alert("Quên mật khẩu? Tính năng này sẽ được bổ sung sau.");
}

// Chuyển sang modal Đăng ký
function switchToSignup() {
    closeModal("loginModal");
    showModal("registerModal");
}

// Chuyển sang modal Đăng nhập
function switchToLogin() {
    closeModal("registerModal");
    showModal("loginModal");
}

// Hàm xử lý đăng nhập
function handleLogin(event) {
    event.preventDefault(); // Ngăn chặn việc gửi form

    const username = document.querySelector('input[name="ten_dang_nhap"]').value; // Thay đổi tên trường
    const password = document.querySelector('input[name="mat_khau"]').value; // Thay đổi tên trường

    // Gửi thông tin đăng nhập đến server
    fetch('/api/login', { // Thay đổi đường dẫn API
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ ten_dang_nhap: username, mat_khau: password }), // Cập nhật tên thuộc tính
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Mạng phản hồi không hợp lệ');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                // Chuyển hướng dựa vào vai trò
                switch (data.vai_tro_id) {
                    case 1:
                        window.location.href = '../../../WEB-INF/views/user/home.jsp';
                        break;
                    case 2:
                        window.location.href = '../../../WEB-INF/views/staff/staff.jsp';
                        break;
                    case 3:
                        window.location.href = '../../../WEB-INF/views/admin/dashboard/show.jsp';
                        break;
                    default:
                        alert('Vai trò không hợp lệ.');
                }
            } else {
                alert('Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.');
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            alert('Đã xảy ra lỗi khi đăng nhập. Vui lòng thử lại sau.');
        });
}