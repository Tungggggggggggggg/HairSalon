<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Phản hồi thành công</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: block; /* Thay đổi từ flex thành block để không ảnh hưởng tới footer */
        }

        /* Phần nội dung success-container */
        .success-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px 30px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            margin: 100px auto; /* Đảm bảo căn giữa nội dung */
        }

        .success-container h1 {
            color: #28a745;
            font-size: 28px;
            margin-bottom: 15px;
        }

        .success-container p {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .success-container a {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .success-container a:hover {
            background-color: #0056b3;
        }

        .success-icon {
            font-size: 50px;
            color: #28a745;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

<div class="success-container">
    <div class="success-icon">✔</div>
    <h1>Phản hồi của bạn đã được gửi thành công!</h1>
    <p>Cảm ơn bạn đã dành thời gian phản hồi. Chúng tôi rất trân trọng ý kiến của bạn và sẽ sử dụng nó để cải thiện dịch vụ.</p>
    <a href="/home/report/sucess">Quay lại trang phản hồi</a>
</div>

<jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
</body>

</html>
