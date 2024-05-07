document.addEventListener("DOMContentLoaded", function () {
    // Get the current URL
    var currentUrl = window.location.href;

    // Select all navigation links
    var navLinks = document.querySelectorAll('.nav-link');

    // Loop through each link and compare its href with the current URL
    navLinks.forEach(function (link) {
        if (link.href === currentUrl) {
            link.classList.add('active'); // Add a class to highlight the active link
        }
    });
});

