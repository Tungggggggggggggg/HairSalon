<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/auth.css"> 
</head>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <button id="openRegisterModal">Đăng Ký</button>

    <!-- Registration Modal -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Đăng Ký</h2>
            <form action="/register" method="POST">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Đăng Ký</button>
            </form>
        </div>
    </div>

    <!-- Modal Script -->
    <script>
        var registerModal = document.getElementById('registerModal');
        var registerBtn = document.getElementById('openRegisterModal');
        var registerSpan = document.getElementsByClassName('close')[0];

        registerBtn.onclick = function() {
            registerModal.style.display = 'block';
        }

        registerSpan.onclick = function() {
            registerModal.style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target == registerModal) {
                registerModal.style.display = 'none';
            }
        }
    </script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
