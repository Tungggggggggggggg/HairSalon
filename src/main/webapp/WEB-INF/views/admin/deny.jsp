<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSalon</title>
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <style>
        /* Cài đặt cơ bản cho body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Định dạng cho container chứa lỗi */
        .error-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #fff;
        }

        /* Định dạng cho nội dung lỗi */
        .error-content {
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            width: 80%;
            max-width: 600px;
        }

        /* Định dạng tiêu đề lỗi */
        h1 {
            font-size: 36px;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        /* Định dạng đoạn văn lỗi */
        p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        /* Định dạng các nút hành động */
        .error-actions a {
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-home {
            background-color: #3498db;
            color: white;
        }

        .btn-home:hover {
            background-color: #2980b9;
        }

        .btn-contact {
            background-color: #2ecc71;
            color: white;
        }

        .btn-contact:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-content">
        <h1>Oops! Bạn không có quyền truy cập trang này</h1>
        <p>Rất tiếc, nhưng bạn không có quyền truy cập vào trang này. Có thể vì bạn chưa đăng nhập, hoặc tài khoản của bạn không có quyền truy cập trang này.</p>
        <div class="error-actions">
            <a href="javascript:history.back()" class="btn-home">Quay lại</a>
            <a href="mailto:support@example.com" class="btn-contact">Liên hệ hỗ trợ</a>
        </div>
    </div>
</div>
</body>
</html>
