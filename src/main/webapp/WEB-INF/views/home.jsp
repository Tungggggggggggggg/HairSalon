<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSalon - Trang Chủ</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="banner">
    <h1>Chào mừng đến với JSalon</h1>
    <p>Tìm kiếm, đặt lịch và trải nghiệm dịch vụ chăm sóc tóc dễ dàng và thuận tiện.</p>
    
    <button id="openBookingModal">Đặt Lịch Ngay</button>

    <!-- Booking Modal -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Đặt lịch ngay</h2>
            <form action="booking" method="POST">
                <label for="name">Tên của bạn:</label>
                <input type="text" id="name" name="name" required>

                <label for="phone">Số điện thoại:</label>
                <input type="tel" id="phone" name="phone" required>

                <label for="date">Chọn ngày:</label>
                <div style="display: flex; align-items: center;">
                    <input type="text" id="date" name="date" placeholder="dd/MM/yyyy" required pattern="\d{2}/\d{2}/\d{4}" title="Nhập ngày theo định dạng dd/MM/yyyy">
                    <button type="button" id="openCalendar">📅</button> <!-- Nút hiển thị lịch -->
                </div>

                <label for="service">Chọn dịch vụ:</label>
                <select id="service" name="service" required>
                    <option value="haircut">Cắt tóc</option>
                    <option value="haircare">Chăm sóc tóc</option>
                    <option value="styling">Tạo kiểu</option>
                </select>

                <button type="submit">Đặt Lịch</button>
            </form>
        </div>
    </div>

    <!-- Modal Script -->
    <script>
        var modal = document.getElementById('bookingModal');
        var btn = document.getElementById('openBookingModal');
        var span = document.getElementsByClassName('close')[0];

        btn.onclick = function() {
            modal.style.display = 'block';
        }

        span.onclick = function() {
            modal.style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        }

        // Khởi tạo Datepicker
        $(document).ready(function() {
            $("#date").datepicker({
                dateFormat: 'dd/mm/yy', // Định dạng ngày hiển thị
                onSelect: function(dateText) {
                    $(this).val(dateText); // Đặt giá trị cho input khi chọn ngày
                }
            });

            // Hiển thị Datepicker khi nhấn nút
            $("#openCalendar").on("click", function() {
                $("#date").datepicker("show");
            });
        });
    </script>
    
</section>

<section class="services">
    <h2>Dịch vụ của chúng tôi</h2>
    <div class="service-item">
        <h3>Cắt tóc chuyên nghiệp</h3>
        <p>Đội ngũ chuyên gia với nhiều năm kinh nghiệm.</p>
    </div>
    <div class="service-item">
        <h3>Chăm sóc tóc</h3>
        <p>Sản phẩm chất lượng cao cho mái tóc khỏe mạnh.</p>
    </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
