        // Mở cuộc trò chuyện với khách hàng
        function openChat(userId, userElement) {
            // Xóa chấm đỏ (đã đọc) khi nhấp vào người dùng
            const unreadIndicator = userElement.querySelector('.unread-indicator');
            if (unreadIndicator) {
                unreadIndicator.remove();
            }

            // Giả lập tải dữ liệu tin nhắn của khách hàng
            const chatMessages = document.getElementById('chatMessages');
            chatMessages.innerHTML = '';

            if (userId === 1) {
                chatMessages.innerHTML += `
                    <div class="message received">
                        <strong>Khách hàng 1:</strong> Xin chào! Dịch vụ rất tốt!
                    </div>
                    <div class="message sent">
                        <strong>Admin:</strong> Cảm ơn bạn đã phản hồi!
                    </div>
                `;
            } else if (userId === 2) {
                chatMessages.innerHTML += `
                    <div class="message received">
                        <strong>Khách hàng 2:</strong> Tôi cần hỗ trợ về dịch vụ nhuộm tóc.
                    </div>
                `;
            } else if (userId === 3) {
                chatMessages.innerHTML += `
                    <div class="message received">
                        <strong>Khách hàng 3:</strong> Dịch vụ cắt tóc có ưu đãi không?
                    </div>
                `;
            }
        }

        // Gửi tin nhắn khi nhấn Enter
        function sendMessageOnEnter(event) {
            if (event.key === 'Enter') {
                sendMessage();
            }
        }

        // Gửi tin nhắn
        function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const message = messageInput.value.trim();
            if (message === '') return;

            // Hiển thị tin nhắn trên giao diện
            const chatMessages = document.getElementById('chatMessages');
            chatMessages.innerHTML += `
                <div class="message sent">
                    <strong>Admin:</strong> ${message}
                </div>
            `;
            chatMessages.scrollTop = chatMessages.scrollHeight; // Cuộn xuống cuối cùng

            // Xóa nội dung tin nhắn trong ô nhập
            messageInput.value = '';

            // Giả lập gửi tin nhắn tới server
            console.log(`Gửi tin nhắn: ${message}`);
        }