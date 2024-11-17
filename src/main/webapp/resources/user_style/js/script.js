let currentIndex = 0;
const carousel = document.getElementById("service-list");
const serviceCards = document.querySelectorAll(".service-card-wrapper");
const totalItems = serviceCards.length;
const cardWidth = serviceCards[0].offsetWidth + 20;

// Function to move the slide
function moveSlide(direction) {
    currentIndex += direction;

    if (currentIndex < 0) {
        currentIndex = totalItems - 1; // Loop to last item
    } else if (currentIndex >= totalItems) {
        currentIndex = 0; // Loop to first item
    }

    const offset = -currentIndex * cardWidth;
    carousel.style.transition = "transform 0.3s ease-in-out"; // Smooth transition
    carousel.style.transform = `translateX(${offset}px)`;
}

document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
document.querySelector('.next').addEventListener('click', () => moveSlide(1));


