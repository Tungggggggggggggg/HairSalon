<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <title>Quản lý phản hồi</title>
        <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
            rel="stylesheet"
        />
        <link
            href="../../../../resources/admin/css/styles.css"
            rel="stylesheet"
        />
        <script
            src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>

    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý phản hồi khách hàng</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Quản lý phản hồi</li>
                        </ol>

                        <!-- Bảng danh sách phản hồi -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách phản hồi
                            </div>
                            <div class="card-body">
                                <table id="responseTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID phản hồi</th>
                                            <th>Tên khách hàng</th>
                                            <th>Nội dung</th>
                                            <th>Ngày gửi</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="responseTableBody">
                                        <tr>
                                            <td>1</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>Phục vụ rất tốt, tôi hài lòng.</td>
                                            <td>2024-10-20</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" onclick="openChat(this)">Trả lời</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Trần Thị B</td>
                                            <td>Dịch vụ chưa được như mong đợi.</td>
                                            <td>2024-10-21</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" onclick="openChat(this)">Trả lời</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Modal cuộc trò chuyện -->
                        <div class="modal fade" id="chatModal" tabindex="-1" aria-labelledby="chatModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="chatModalLabel">Cuộc trò chuyện với <span id="chatCustomerName"></span></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="chatHistory" class="border p-3 mb-3" style="height: 300px; overflow-y: auto; background-color: #f8f9fa;">
                                            <!-- Lịch sử tin nhắn sẽ hiển thị tại đây -->
                                        </div>
                                        <div class="input-group">
                                            <textarea id="chatInput" class="form-control" rows="2" placeholder="Nhập tin nhắn..." required></textarea>
                                            <button class="btn btn-primary" onclick="sendMessage()">Gửi</button>
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

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../../../../resources/admin/js/datatables-simple-demo.js"></script>

        <script>
            let chatHistory = {};  // Để lưu trữ cuộc trò chuyện của từng khách hàng

            // Hàm để mở cuộc trò chuyện
            function openChat(button) {
                const row = button.parentElement.parentElement;
                const responseId = row.children[0].innerText;
                const customerName = row.children[1].innerText;
                const responseContent = row.children[2].innerText;

                // Hiển thị tên khách hàng trong modal
                document.getElementById('chatCustomerName').innerText = customerName;

                // Tạo lịch sử chat nếu chưa có
                if (!chatHistory[responseId]) {
                    chatHistory[responseId] = [
                        { sender: 'Khách hàng', message: responseContent, time: new Date().toLocaleString() }
                    ];
                }

                // Hiển thị lịch sử cuộc trò chuyện
                updateChatHistory(responseId);

                // Mở modal
                const chatModal = new bootstrap.Modal(document.getElementById('chatModal'));
                chatModal.show();
            }

            // Hàm để hiển thị lịch sử cuộc trò chuyện
            function updateChatHistory(responseId) {
                const chatBox = document.getElementById('chatHistory');
                chatBox.innerHTML = '';  // Xóa nội dung hiện tại

                chatHistory[responseId].forEach(entry => {
                    const messageElement = document.createElement('div');
                    messageElement.classList.add('mb-2');

                    const sender = document.createElement('strong');
                    sender.textContent = `${entry.sender} (${entry.time}): `;
                    messageElement.appendChild(sender);

                    const messageText = document.createElement('span');
                    messageText.textContent = entry.message;
                    messageElement.appendChild(messageText);

                    chatBox.appendChild(messageElement);
                });

                chatBox.scrollTop = chatBox.scrollHeight;  // Tự động cuộn xuống dưới
            }

            // Hàm để gửi tin nhắn
            function sendMessage() {
                const message = document.getElementById('chatInput').value;
                if (message.trim() === '') {
                    alert('Vui lòng nhập tin nhắn!');
                    return;
                }

                const responseId = document.getElementById('chatCustomerName').innerText;

                // Lưu tin nhắn vào lịch sử
                chatHistory[responseId].push({
                    sender: 'Admin',
                    message: message,
                    time: new Date().toLocaleString()
                });

                // Cập nhật giao diện cuộc trò chuyện
                updateChatHistory(responseId);

                // Xóa nội dung tin nhắn sau khi gửi
                document.getElementById('chatInput').value = '';
            }
        </script>
    </body>
</html>
