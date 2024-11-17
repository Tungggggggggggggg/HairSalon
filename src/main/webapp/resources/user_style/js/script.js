let currentIndex = 0; // Starting index for the carousel
const carousel = document.getElementById("service-list");
const serviceCards = document.querySelectorAll(".service-card-wrapper");
const totalItems = serviceCards.length;
const cardWidth = serviceCards[0].offsetWidth + 20; // Card width including the gap

// Function to move the slide
function moveSlide(direction) {
    // Update current index based on direction
    currentIndex += direction;

    // Loop back to the start or end if the index is out of bounds
    if (currentIndex < 0) {
        currentIndex = totalItems - 1; // Loop to last item
    } else if (currentIndex >= totalItems) {
        currentIndex = 0; // Loop to first item
    }

    // Calculate the offset and apply it to the carousel
    const offset = -currentIndex * cardWidth;
    carousel.style.transition = "transform 0.3s ease-in-out"; // Smooth transition
    carousel.style.transform = `translateX(${offset}px)`;
}

// Attach event listeners to the buttons
document.querySelector('.prev').addEventListener('click', () => moveSlide(-1)); // Prev button
document.querySelector('.next').addEventListener('click', () => moveSlide(1)); // Next button
