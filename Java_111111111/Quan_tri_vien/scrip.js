//dữ liệu giả:
const feedbacks = [
  {
    id: 1,
    name: "John Doe",
    email: "john@example.com",
    rating: 5,
    comments: "Excellent service!",
    date: "2023-10-01",
    status: "đã trả lời",
  },
  {
    id: 2,
    name: "Jane Smith",
    email: "jane@example.com",
    rating: 4,
    comments: "Good experience, but room for improvement.",
    date: "2023-10-02",
    status: "không trả lời",
  },
];

// Render feedbacks to the table
function renderFeedbacks(filteredFeedbacks) {
  const tableBody = document.getElementById("feedback-table-body");
  tableBody.innerHTML = "";

  filteredFeedbacks.forEach((feedback) => {
    const row = document.createElement("tr");

    row.innerHTML = `
            <td>${feedback.name}</td>
            <td>${feedback.email}</td>
            <td>${feedback.rating} stars</td>
            <td>${feedback.comments}</td>
            <td>${feedback.date}</td>
            <td><span class="status ${
              feedback.status === "replied" ? "replied" : "not-replied"
            }">${
      feedback.status === "replied" ? "đã trả lời" : "không trả lời"
    }</span></td>
            <td>
                <button onclick="replyFeedback(${feedback.id})">Hồi đáp</button>
            </td>
        `;

    tableBody.appendChild(row);
  });
}

// Apply filters to feedback list
function applyFilters() {
  const ratingFilter = document.getElementById("rating-filter").value;
  const statusFilter = document.getElementById("status-filter").value;
  const dateFilter = document.getElementById("date-filter").value;

  let filteredFeedbacks = feedbacks;

  if (ratingFilter) {
    filteredFeedbacks = filteredFeedbacks.filter(
      (feedback) => feedback.rating == ratingFilter
    );
  }

  if (statusFilter) {
    filteredFeedbacks = filteredFeedbacks.filter(
      (feedback) => feedback.status === statusFilter
    );
  }

  if (dateFilter) {
    filteredFeedbacks = filteredFeedbacks.filter(
      (feedback) => feedback.date === dateFilter
    );
  }

  renderFeedbacks(filteredFeedbacks);
}

// Handle reply action
function replyFeedback(id) {
  const feedback = feedbacks.find((fb) => fb.id === id);
  if (feedback) {
    alert(`Replying to ${feedback.name} (${feedback.email})`);
    feedback.status = "replied";
    applyFilters(); // Re-render the table with updated status
  }
}

// Initial rendering of feedbacks
renderFeedbacks(feedbacks);

// Add event listeners to filters
document
  .getElementById("rating-filter")
  .addEventListener("change", applyFilters);
document
  .getElementById("status-filter")
  .addEventListener("change", applyFilters);
document.getElementById("date-filter").addEventListener("change", applyFilters);
