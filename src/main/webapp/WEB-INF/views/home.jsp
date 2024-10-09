<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/auth.css" />
    </head>

    <body id="top">
        <%@ include file="/WEB-INF/views/includes/header.jsp" %>

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
            <button id="openBookingModal" onclick="showScheduleModal()">
                Đặt Lịch Ngay
            </button>
        </section>

        <!-- Modal Đặt lịch ngay -->
        <div id="scheduleModal" class="modal-booking">
            <div class="modal-content-booking">
                <span
                    class="close-booking"
                    onclick="closeModal('scheduleModal')"
                    >&times;</span
                >
                <h2>Đặt Lịch Ngay</h2>
                <form action="/schedule" method="post">
                    <div>
                        <label for="service">Chọn Dịch Vụ</label>
                        <select id="service" name="service">
                            <option value="haircut">Cắt Tóc</option>
                            <option value="shampoo">Gội Đầu</option>
                            <option value="color">Nhuộm Tóc</option>
                            <option value="shave">Cạo Râu</option>
                        </select>
                    </div>

                    <div>
                        <label for="stylist">Chọn Nhà Tạo Mẫu</label>
                        <select id="stylist" name="stylist">
                            <option value="stylist1">Nhà tạo mẫu A</option>
                            <option value="stylist2">Nhà tạo mẫu B</option>
                            <option value="stylist3">Nhà tạo mẫu C</option>
                        </select>
                    </div>

                    <div>
                        <label for="date">Chọn Ngày</label>
                        <input
                            type="text"
                            id="datePicker"
                            name="date"
                            placeholder="dd/MM/yyyy"
                            required
                        />
                    </div>

                    <div>
                        <label for="time">Chọn Giờ</label>
                        <input type="time" id="time" name="time" required />
                    </div>

                    <button type="submit">Xác Nhận</button>
                </form>
            </div>
        </div>

        <!-- Slider dịch vụ -->
        <section id="services" class="service-slider">
            <h1>Dịch vụ của chúng tôi</h1>
            <div class="service-container">
                <div class="service-slide active">
                    <img
                        src="${pageContext.request.contextPath}/images/cattoc.webp"
                        alt="Dịch vụ 1"
                    />
                    <h3>Cắt tóc chuyên nghiệp</h3>
                    <p>Đội ngũ chuyên gia với nhiều năm kinh nghiệm.</p>
                </div>
                <div class="service-slide">
                    <img
                        src="${pageContext.request.contextPath}/images/chamsoctoc.avif"
                        alt="Dịch vụ 2"
                    />
                    <h3>Chăm sóc tóc</h3>
                    <p>Sản phẩm chất lượng cao cho mái tóc khỏe mạnh.</p>
                </div>
                <div class="service-slide">
                    <img
                        src="${pageContext.request.contextPath}/images/nhuomtoc.jpg"
                        alt="Dịch vụ 3"
                    />
                    <h3>Nhuộm tóc sáng tạo</h3>
                    <p>Màu tóc bền, đẹp và an toàn.</p>
                </div>
                <div class="service-slide">
                    <img
                        src="${pageContext.request.contextPath}/images/uontoc.webp"
                        alt="Dịch vụ 4"
                    />
                    <h3>Uốn tóc tạo kiểu</h3>
                    <p>Tạo kiểu tóc bồng bềnh, đẹp tự nhiên.</p>
                </div>
            </div>
        </section>

        <!-- Phần đánh giá khách hàng -->
        <section id="reviews" class="reviews-section">
            <div class="container">
                <h1 class="section-title">Khách hàng nói gì về chúng tôi</h1>
                <div class="reviews-container">
                    <div class="review-item">
                        <img
                            src="${pageContext.request.contextPath}/images/jack.jpg"
                            class="customer-photo"
                            alt="Customer Photo 1"
                        />
                        <p class="customer-name">Jack</p>
                        <p class="customer-review">
                            "Dịch vụ tuyệt vời, mình rất hài lòng với kiểu tóc
                            mới!"
                        </p>
                    </div>

                    <div class="review-item">
                        <img
                            src="${pageContext.request.contextPath}/images/j97.jpg"
                            class="customer-photo"
                            alt="Customer Photo 2"
                        />
                        <p class="customer-name">J97</p>
                        <p class="customer-review">
                            "Nhân viên rất nhiệt tình, mình sẽ quay lại lần
                            sau."
                        </p>
                    </div>

                    <div class="review-item">
                        <img
                            src="${pageContext.request.contextPath}/images/meomeo.jpg"
                            class="customer-photo"
                            alt="Customer Photo 3"
                        />
                        <p class="customer-name">Meo Meo</p>
                        <p class="customer-review">
                            "Không gian thoáng mát, dịch vụ đa dạng, rất đáng
                            thử!"
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- JavaScript cho Datepicker, Modal và Slider -->
        <script>
            $(function () {
                $("#datePicker").datepicker({
                    dateFormat: "dd/mm/yy",
                    minDate: 0,
                });

                const now = new Date();
                const timeInput = document.getElementById("time");

                // Cập nhật giá trị min cho time input để chặn giờ trong quá khứ
                timeInput.addEventListener("change", function () {
                    const selectedTime = new Date();
                    const timeParts = this.value.split(":");
                    selectedTime.setHours(timeParts[0], timeParts[1]);

                    if (selectedTime < now) {
                        alert("Bạn không thể chọn thời gian trong quá khứ!");
                        this.value = ""; // Reset lại giá trị của input
                    }
                });
            });
            // Hiển thị modal với hiệu ứng mượt mà
            function showScheduleModal() {
                const modal = $("#scheduleModal");
                modal.css("display", "block"); 
                setTimeout(() => {
                    modal.addClass("show");
                }, 10); 
            }

            // Đóng modal với hiệu ứng mượt mà
            function closeModal(modalId) {
                const modal = $("#" + modalId);
                modal.removeClass("show"); 
                setTimeout(() => {
                    modal.css("display", "none"); 
                }, 500); 
            }

            let currentSlide = 0;
            const slides = document.querySelectorAll(".service-slide");
            const totalSlides = slides.length;

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    if (i === index) {
                        slide.classList.add("active"); 
                    } else {
                        slide.classList.remove("active"); 
                    }
                });
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % totalSlides;
                showSlide(currentSlide);
            }

            // Khởi tạo slide đầu tiên
            showSlide(currentSlide);
            setInterval(nextSlide, 3000);
            $('a[href^="#"]').on("click", function (event) {
                event.preventDefault();
                $("html, body").animate(
                    {
                        scrollTop: $($.attr(this, "href")).offset().top,
                    },
                    500
                );
            });
        </script>

        <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
    </body>
</html>
