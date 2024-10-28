<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý phản hồi trực tiếp</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý phản hồi trực tiếp</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý phản hồi trực tiếp</li>
                    </ol>

                    <div class="row">
                        <!-- Danh sách người dùng -->
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-users me-1"></i>
                                    Danh sách khách hàng
                                </div>
                                <div class="list-group" id="userList">
                                    <!-- Dữ liệu mẫu với chấm đỏ chỉ thị chưa đọc -->
                                    <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="openChat(1, this)">
                                        Khách hàng 1
                                        <span class="badge bg-danger rounded-circle unread-indicator">●</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="openChat(2, this)">
                                        Khách hàng 2
                                        <span class="badge bg-danger rounded-circle unread-indicator">●</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="openChat(3, this)">
                                        Khách hàng 3
                                        <span class="badge bg-danger rounded-circle unread-indicator">●</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Khu vực chat -->
                        <div class="col-md-8">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-comments me-1"></i>
                                    Trò chuyện với khách hàng
                                </div>
                                <div class="card-body" id="chatArea">
                                    <div id="chatMessages" class="chat-messages">
                                        <!-- Tin nhắn mẫu -->
                                        <div class="message received">
                                            <strong>Khách hàng 1:</strong> Xin chào! Dịch vụ rất tốt!
                                        </div>
                                        <div class="message sent">
                                            <strong>Admin:</strong> Cảm ơn bạn đã phản hồi!
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="input-group">
                                        <input type="text" id="messageInput" class="form-control" placeholder="Nhập tin nhắn..." onkeypress="sendMessageOnEnter(event)">
                                        <button class="btn btn-primary" onclick="sendMessage()"><i class="fas fa-paper-plane"></i> Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/admin_style/js/response_management.js"></script>
    <script src="/admin_style/js/scripts.js"></script>
</body>
</html>
