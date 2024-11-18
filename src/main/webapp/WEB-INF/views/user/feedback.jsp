<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Phản hồi khách hàng</title>
    <link rel="stylesheet" href="/user_style/css/feedback.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin: 20px 0;
        }
        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        form input, form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        form button {
            background: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        form button:hover {
            background: #0056b3;
        }
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 10px 0;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            font-size: 16px;
        }

        .checkbox-item input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            accent-color: #007BFF; /* Tùy chỉnh màu sắc */
            cursor: pointer;
        }

        .checkbox-item label {
            cursor: pointer;
            color: #333;
        }

        .checkbox-item input[type="checkbox"]:hover {
            outline: 2px solid #0056b3;
        }

        .checkbox-item input[type="checkbox"]:checked {
            background-color: #007BFF;
            border-color: #007BFF;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

<div class="container">
    <h1>Phản hồi từ khách hàng</h1>

    <form action="/report/save" method="post" >
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <label for="name">Họ và tên</label>
        <input type="text" id="name" name="userName"  placeholder="Nhập họ và tên của bạn" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required />

        <label for="phone">Số điện thoại</label>
        <input type="phone" id="phone" name="phone" placeholder="Nhập số điện thoại của bạn" required />

        <label for="Feedback">Lựa chọn nội dung bạn muốn phản hồi</label>
        <div class="checkbox-group">
            <div class="checkbox-item">
                <input type="checkbox" id="service" name="feedbackType" value="Dịch vụ" />
                <label for="service">Dịch vụ</label>
            </div>

            <div class="checkbox-item">
                <input type="checkbox" id="quality" name="feedbackType" value="Chất lượng sản phẩm" />
                <label for="quality">Chất lượng sản phẩm</label>
            </div>

            <div class="checkbox-item">
                <input type="checkbox" id="support" name="feedbackType" value="Hỗ trợ khách hàng" />
                <label for="support">Hỗ trợ khách hàng</label>
            </div>

            <div class="checkbox-item">
                <input type="checkbox" id="website" name="feedbackType" value="Trải nghiệm website" />
                <label for="website">Trải nghiệm website</label>
            </div>

            <div class="checkbox-item">
                <input type="checkbox" id="pricing" name="feedbackType" value="Giá cả" />
                <label for="pricing">Giá cả</label>
            </div>

            <div class="checkbox-item">
                <input type="checkbox" id="other" name="feedbackType" value="Khác" />
                <label for="other">Khác</label>
            </div>
        </div>

        <label for="message">Nội dung phản hồi</label>
        <textarea id="message" name="message" rows="5" placeholder="Nhập nội dung phản hồi" required></textarea>

        <button type="submit">Gửi phản hồi</button>
    </form>
</div>

<jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
</body>
</html>
