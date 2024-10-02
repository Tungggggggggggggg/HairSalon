<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<header>
    <nav>
        <ul class="nav-left">
            <li><a href="/home">Trang chủ</a></li>
            <li><a href="/about">Giới thiệu</a></li>
            <li><a href="/services">Dịch vụ</a></li>
        </ul>
        <ul class="nav-right">
            <li><a href="javascript:void(0);" onclick="showModal('loginModal')" class="auth-btn">Đăng nhập</a></li>
            <li><a href="javascript:void(0);" onclick="showModal('registerModal')" class="auth-btn">Đăng ký</a></li>
        </ul>
    </nav>
</header>

<!-- Modal Đăng nhập -->
<div id="loginModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('loginModal')">&times;</span>
        <div class="form-container">
            <p class="title">Đăng nhập</p>
            <div class="tab-buttons">
                <button id="emailTab" class="tab-button active" onclick="switchToEmailLogin()">Email</button>
                <button id="phoneTab" class="tab-button" onclick="switchToPhoneLogin()">Số Điện Thoại</button>
            </div>
            <form id="loginForm" class="form" method="post" action="/login" onsubmit="login(event)">
                <input id="loginEmail" class="input active" placeholder="Email" type="text" name="Email" />
                <input id="loginPhone" class="input" placeholder="Số Điện Thoại" type="text" name="Phone" />
                <div id="emailError" class="error-message"></div>
                <div id="phoneError" class="error-message"></div>

                <input id="loginPassword" class="input" placeholder="Mật khẩu" type="password" name="Password" />
                <div id="passwordError" class="error-message"></div>

                <div id="loginMessage"></div>
                <a href="javascript:void(0);" onclick="showQuenPassModal()" class="page-link"><span class="page-link-label">Quên mật khẩu?</span></a>
                <button class="form-btn" type="submit" name="dangnhap">Đăng nhập</button>
            </form>
            <p class="sign-up-label">
                Chưa có tài khoản?<span class="sign-up-link"><a href="javascript:switchToSignup()"> Đăng kí</a></span>
            </p>
        </div>
    </div>
</div>

<!-- Modal Đăng ký -->
<div id="registerModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('registerModal')">&times;</span>
        <div class="form-container">
            <p class="title">Tạo tài khoản</p>
            <form id="registerForm" class="form" method="post" action="/register" onsubmit="register(event)">
                <input type="text" id="regFullName" class="input" placeholder="Họ và Tên" name="Fullname" />
                <div id="fullnameError" class="error-message"></div>

                <input type="text" id="regEmail" class="input" placeholder="Email" name="Email" />
                <div id="emailError" class="error-message"></div>

                <input type="text" id="regPhone" class="input" placeholder="Số Điện Thoại" name="Phone" />
                <div id="phoneError" class="error-message"></div>

                <input type="password" id="regPassWord" class="input" placeholder="Mật khẩu" name="Password" />
                <div id="passwordError" class="error-message"></div>

                <button class="form-btn" type="submit">Tạo tài khoản</button>
                <div id="regMessage" class="error-message"></div>
            </form>
            <p class="sign-in-label">
                Đã có tài khoản?<span class="sign-in-link"><a href="javascript:switchToLogin()"> Đăng nhập</a></span>
            </p>
        </div>
    </div>
</div>

<script>
    function showModal(modalId) {
        document.getElementById(modalId).style.display = 'block';
    }
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
    function switchToSignup() {
        closeModal("loginModal");
        showModal("registerModal");
    }
    function switchToLogin() {
        closeModal("registerModal");
        showModal("loginModal");
    }
    function switchToEmailLogin() {
        document.getElementById("loginEmail").style.display = "block";
        document.getElementById("loginPhone").style.display = "none";
        document.getElementById("emailTab").classList.add("active");
        document.getElementById("phoneTab").classList.remove("active");
    }
    function switchToPhoneLogin() {
        document.getElementById("loginEmail").style.display = "none";
        document.getElementById("loginPhone").style.display = "block";
        document.getElementById("emailTab").classList.remove("active");
        document.getElementById("phoneTab").classList.add("active");
    }
</script>
