document.getElementById("use-points").addEventListener("change", function () {
  const pointsAvailable = 120; // Giả sử đây là điểm khách hàng có sẵn
  const discountRate = 10; // Mỗi 10 điểm đổi được $1
  const usePoints = this.checked;

  const pointsUsed = usePoints ? Math.min(pointsAvailable, 100) : 0; // Giả sử tối đa 100 điểm có thể dùng
  const discountAmount = pointsUsed / discountRate;

  document.getElementById("points-used").innerText = pointsUsed;
  document.getElementById("discount-amount").innerText = discountAmount;

  // Hiển thị thông tin giảm giá
  document.getElementById("discount-info").style.display = usePoints
    ? "block"
    : "none";
});

// Xử lý form submit
document
  .getElementById("booking-form")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const usePoints = document.getElementById("use-points").checked;
    const pointsUsed = usePoints
      ? document.getElementById("points-used").innerText
      : 0;

    alert(`You have used ${pointsUsed} points. Your booking is confirmed!`);
  });
