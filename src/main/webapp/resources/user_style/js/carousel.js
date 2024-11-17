document.addEventListener('DOMContentLoaded', function () {
    // Lấy các phần tử cần thiết
    const carouselContainer = document.querySelector('.stylist-container'); // Container của các stylist
    const items = document.querySelectorAll('.stylist-item'); // Tất cả các stylist
    const prevButton = document.getElementById('prev-stylist'); // Nút "Prev"
    const nextButton = document.getElementById('next-stylist'); // Nút "Next"

    let currentIndex = 0; // Chỉ số của stylist đầu tiên đang hiển thị
    const visibleItems = 3; // Số lượng stylist hiển thị cùng lúc (có thể điều chỉnh)
    let itemWidth = items[0].offsetWidth + 30; // Kích thước của 1 stylist + khoảng cách giữa chúng

    // Hàm cập nhật vị trí của carousel
    function updateCarousel() {
        const offset = -(currentIndex * itemWidth); // Tính toán khoảng cách cần di chuyển
        carouselContainer.style.transform = `translateX(${offset}px)`; // Di chuyển carousel
        carouselContainer.style.transition = 'transform 0.4s ease-in-out'; // Hiệu ứng mượt mà
    }

    // Xử lý khi nhấn nút "Next"
    nextButton.addEventListener('click', function () {
        if (currentIndex < items.length - visibleItems) { // Kiểm tra còn stylist ở phía sau
            currentIndex++; // Tăng chỉ số
            updateCarousel(); // Cập nhật vị trí
        }
    });

    // Xử lý khi nhấn nút "Prev"
    prevButton.addEventListener('click', function () {
        if (currentIndex > 0) { // Kiểm tra không phải stylist đầu tiên
            currentIndex--; // Giảm chỉ số
            updateCarousel(); // Cập nhật vị trí
        }
    });

    // Xử lý khi kích thước trình duyệt thay đổi
    window.addEventListener('resize', function () {
        itemWidth = items[0].offsetWidth + 30; // Tính lại kích thước mỗi stylist
        updateCarousel(); // Đảm bảo carousel hiển thị đúng
    });
});
