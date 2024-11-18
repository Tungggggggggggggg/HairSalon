<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSalon - Trang Chủ</title>
        <link
            rel="stylesheet"
            href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
        />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="/user_style/css/style.css" />
    </head>

    <body id="top">
        <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

        <section id="about" class="banner">
            <h1>Chào mừng đến với JSalon</h1>
            <p>
                JSalon tự hào mang đến cho bạn các dịch vụ chăm sóc tóc chuyên
                nghiệp và hiện đại. Từ việc cắt tóc thời thượng, nhuộm tóc sáng
                tạo đến uốn tóc bồng bềnh, chúng tôi luôn sẵn sàng đáp ứng mọi
                nhu cầu làm đẹp của bạn. Với đội ngũ chuyên gia có nhiều năm
                kinh nghiệm, chúng tôi cam kết đem lại sự hài lòng tuyệt đối cho
                bạn trong từng lần ghé thăm.
            </p>
            <p>
                Bạn có thể dễ dàng tìm kiếm và đặt lịch thông qua hệ thống trực
                tuyến của chúng tôi, tiết kiệm thời gian và đảm bảo có lịch hẹn
                phù hợp. Trải nghiệm quy trình đơn giản và tiện lợi với một vài
                bước click chuột, để có được mái tóc ưng ý mà không cần phải lo
                lắng về việc chờ đợi.
            </p>
            <form action="/booking" method="get" style="display: inline">
                <button type="submit">Đặt lịch ngay</button>
            </form>
        </section>

        <section class="services-section">
            <h1>DỊCH VỤ</h1>
            <div class="carousel-container">
                <div class="carousel" id="service-list">
                    <c:forEach var="service" items="${services}">
                        <div class="service-card-wrapper">
                            <a href="/home/service/${service.id}" class="service-link">
                                <div class="service-card">
                                    <div class="image-container">
                                        <img src="/images/service/${service.avatar}" alt="${service.name}" />
                                    </div>
                                    <h3>${service.name}</h3>
                                    <p>${service.description}</p>
                                    <p class="price">Giá từ <fmt:formatNumber value="${service.price}" pattern="#,###" />đ</p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
                <button class="next" onclick="moveSlide(1)">&#10095;</button>
            </div>
        </section>
        <script src="user_style/js/script.js"></script>


        <!-- Phần Top Stylist -->
        <section id="top-stylist" class="top-stylist-section">
            <div class="container">
                <h1 class="section-title">TOP NHÂN VIÊN XUẤT SẮC TRONG THÁNG</h1>
                <div class="carousel-container">
                    <div class="stylist-container" id="stylist-list">
                        <!-- Stylists will be displayed here -->
                        <div class="stylist-item">
                            <img src="/user_style/images/HoangQuocBao.jpg" class="stylist-photo" alt="Hoàng Quốc Bảo" />
                            <p class="stylist-name">Hoàng Quốc Bảo</p>
                        </div>
                        <div class="stylist-item">
                            <img src="/user_style/images/LeThuHa.jpg" class="stylist-photo" alt="Lê Thu Hà" />
                            <p class="stylist-name">Lê Thu Hà</p>
                        </div>
                        <div class="stylist-item">
                            <img src="/user_style/images/NgoBaVinh.jpg" class="stylist-photo" alt="Ngô Bá Vinh" />
                            <p class="stylist-name">Ngô Bá Vinh</p>
                        </div>
                        <div class="stylist-item">
                            <img src="/user_style/images/NguyenThiHong.jpg" class="stylist-photo" alt="Nguyễn Thị Hồng" />
                            <p class="stylist-name">Nguyễn Thị Hồng</p>
                        </div>
                        <!-- Additional Stylists -->
                        <div class="stylist-item">
                            <img src="/user_style/images/PhamTuanAnh.jpg" class="stylist-photo" alt="Phạm Tuấn Anh" />
                            <p class="stylist-name">Phạm Tuấn Anh</p>
                        </div>
                        <div class="stylist-item">
                            <img src="/user_style/images/TranVanMinh.jpg" class="stylist-photo" alt="Trần Văn Minh" />
                            <p class="stylist-name">Trần Văn Minh</p>
                        </div>
                        <div class="stylist-item">
                            <img src="/user_style/images/NguyenVanChung.jpg" class="stylist-photo" alt="Nguyễn Văn Chung" />
                            <p class="stylist-name">Nguyễn Văn Chung</p>
                        </div>
                    </div>
                    <button id="prev-stylist" class="prev">&#10094;</button>
                    <button id="next-stylist" class="next">&#10095;</button>
                </div>
            </div>
        </section>
        <script src="/user_style/js/carousel.js"></script>

        <!-- Phần đánh giá khách hàng -->
        <section id="reviews" class="reviews-section">
            <div class="container">
                <h1 class="section-title">ĐÁNH GIÁ CỦA KHÁCH HÀNG</h1>
                <div class="reviews-container">
                    <div class="review-item">
                        <img
                            src="/user_style/images/son.jpg"
                            class="customer-photo"
                            alt="Customer Photo 1"
                        />
                        <p class="customer-name">Sơn</p>
                        <p class="customer-review">
                            "Dịch vụ tuyệt vời, mình rất hài lòng với kiểu tóc
                            mới!"
                        </p>
                    </div>
                    <div class="review-item">
                        <img
                            src="/user_style/images/tung.jpg"
                            class="customer-photo"
                            alt="Customer Photo 2"
                        />
                        <p class="customer-name">Tùng</p>
                        <p class="customer-review">
                            "Nhân viên rất nhiệt tình, mình sẽ quay lại lần
                            sau."
                        </p>
                    </div>
                    <div class="review-item">
                        <img
                            src="/user_style/images/m-tp.jpg"
                            class="customer-photo"
                            alt="Customer Photo 3"
                        />
                        <p class="customer-name">M-TP</p>
                        <p class="customer-review">
                            "Không gian thoáng mát, dịch vụ đa dạng, rất đáng
                            thử!"
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/WEB-INF/views/user/includes/contact.jsp" />
        <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
    </body>
</html>
