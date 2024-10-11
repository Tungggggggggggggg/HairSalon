document
  .getElementById("feedback-form")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    // Get form values
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const rating = document.querySelector('input[name="rating"]:checked')
      ? document.querySelector('input[name="rating"]:checked').value
      : null;
    const comments = document.getElementById("comments").value;

    // Simple validation
    if (!name || !email || !rating || !comments) {
      document.getElementById("feedback-message").innerText =
        "Vui lòng điền vào tất cả các trường!";
      return;
    }

    // Here you would typically send the data to the backend server via an API call

    // Display feedback message
    document.getElementById("feedback-message").innerText =
      "Cảm ơn bạn đã phản hồi của bạn!";

    // Clear the form
    document.getElementById("feedback-form").reset();
  });
