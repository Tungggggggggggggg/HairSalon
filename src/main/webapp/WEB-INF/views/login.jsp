<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/auth.css"> 
</head>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <button id="openLoginModal">Đăng Nhập</button>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Đăng Nhập</h2>
            <form action="/login" method="POST">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Đăng Nhập</button>
            </form>
        </div>
    </div>

    <!-- Modal Script -->
    <script>
        var loginModal = document.getElementById('loginModal');
        var loginBtn = document.getElementById('openLoginModal');
        var loginSpan = document.getElementsByClassName('close')[0];

        loginBtn.onclick = function() {
            loginModal.style.display = 'block';
        }

        loginSpan.onclick = function() {
            loginModal.style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target == loginModal) {
                loginModal.style.display = 'none';
            }
        }
    </script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
