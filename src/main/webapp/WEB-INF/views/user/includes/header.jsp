<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/auth.css" />
        <title>Header</title>
    </head>

    <body>
        <header>
            <nav>
                <div class="logo">
                    <a href="#top">
                        <img
                            src="../../../../resources/user/images/logo.jpg"
                            alt="JSalon Logo"
                        />
                    </a>
                </div>

                <ul class="nav-left">
                    <li><a href="/home#top">Trang chủ</a></li>
                    <li><a href="/home#about">Giới thiệu</a></li>
                    <li><a href="/home#services">Dịch vụ</a></li>
                    <li><a href="/home#reviews">Đánh giá</a></li>
                    <li><a href="/home#contact">Liên hệ</a></li>
                    <li><a href="/user/appointments">Lịch hẹn</a></li>
                </ul>
                <ul class="nav-right">
                    <li>
                        <a
                            href="javascript:void(0);"
                            onclick="showModal('loginModal')"
                            class="auth-btn"
                            >Đăng nhập</a
                        >
                    </li>
                    <li>
                        <a
                            href="javascript:void(0);"
                            onclick="showModal('registerModal')"
                            class="auth-btn"
                            >Đăng ký</a
                        >
                    </li>
                </ul>
            </nav>
        </header>

        <!-- Modal Đăng nhập -->
        <div id="loginModal" class="modal-auth">
            <div class="modal-content-auth">
                <span class="close-auth" onclick="closeModal('loginModal')"
                    >&times;</span
                >
                <h2 class="title-auth">Đăng nhập</h2>
                <div class="tab-buttons-auth">
                    <button
                        class="tab-button-auth active"
                        id="emailTab"
                        onclick="switchToEmailLogin()"
                    >
                        Email
                    </button>
                    <button
                        class="tab-button-auth"
                        id="phoneTab"
                        onclick="switchToPhoneLogin()"
                    >
                        Số Điện Thoại
                    </button>
                </div>
                <form class="form-auth" onsubmit="handleLogin(event)">
                    <input
                        id="loginEmail"
                        class="input-auth email-input"
                        placeholder="Email"
                        type="text"
                        name="username"
                        required
                    />
                    <input
                        id="loginPhone"
                        class="input-auth phone-input"
                        placeholder="Số Điện Thoại"
                        type="text"
                        name="Phone"
                        style="display: none"
                    />
                    <input
                        id="loginPassword"
                        class="input-auth"
                        placeholder="Mật khẩu"
                        type="password"
                        name="password"
                        required
                    />

                    <a
                        href="javascript:void(0);"
                        onclick="showForgotPasswordModal()"
                        class="forgot-password-link"
                        >Quên mật khẩu?</a
                    >

                    <button class="form-btn-auth" type="submit">
                        Đăng nhập
                    </button>
                </form>
                <p class="sign-up-label-auth">
                    Chưa có tài khoản?
                    <span class="sign-up-link-auth"
                        ><a href="javascript:switchToSignup()">Đăng ký</a></span
                    >
                </p>
            </div>
        </div>

        <!-- Modal Đăng ký -->
        <div id="registerModal" class="modal-auth">
            <div class="modal-content-auth">
                <span class="close-auth" onclick="closeModal('registerModal')"
                    >&times;</span
                >
                <h2 class="title-auth">Đăng ký</h2>
                <form class="form-auth">
                    <input
                        type="text"
                        class="input-auth"
                        placeholder="Họ và Tên"
                        name="Fullname"
                        required
                    />
                    <input
                        type="text"
                        class="input-auth"
                        placeholder="Email"
                        name="Email"
                        required
                    />
                    <input
                        type="text"
                        class="input-auth"
                        placeholder="Số Điện Thoại"
                        name="Phone"
                        required
                    />
                    <input
                        type="password"
                        id="regPassword"
                        class="input-auth"
                        placeholder="Mật khẩu"
                        name="Password"
                        required
                    />
                    <input
                        type="password"
                        id="confirmPassword"
                        class="input-auth"
                        placeholder="Nhập lại mật khẩu"
                        name="ConfirmPassword"
                        required
                    />
                    <span
                        id="passwordErrorMessage"
                        class="error-message-auth"
                    ></span>
                    <button
                        class="form-btn-auth"
                        type="submit"
                        onclick="validatePassword(event)"
                    >
                        Đăng ký
                    </button>
                </form>
                <p class="sign-in-label-auth">
                    Đã có tài khoản?
                    <span class="sign-in-link-auth"
                        ><a href="javascript:switchToLogin()">
                            Đăng nhập</a
                        ></span
                    >
                </p>
            </div>
        </div>
        <script src="../../../../resources/user/js/auth.js"></script>
    </body>
</html>
