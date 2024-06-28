async function btnLoginPressed() {
    let username = document.getElementById("username").value;
    if (username == "") {
    }

    let password = document.getElementById("password").value;
    if (password == "") {
    }

    let container = document.getElementById("container");

    let request = await fetch("/auth/login", { method: "POST", headers: { "Content-type": "application/json; charset=UTF-8" }, body: JSON.stringify({ username: username, password: password }) });
    let response = await request.text();
    container.innerHTML = await response;
}

const slider = document.getElementById('news');
const slides = {};
let totalSlides = 0;
let currentIndex = 0;
for (let i = 0; i < 3; i++) {
    slides[i] = document.getElementById(`news-${i}`);
    totalSlides++;
}

document.getElementById('newsLeftBtn').onclick = () => {
    currentIndex = (currentIndex === 0) ? totalSlides - 1 : currentIndex - 1;
    slider.style.transform = `translateX(-${currentIndex * 100}%)`;
};

document.getElementById('newsRightBtn').onclick = () => {
    currentIndex = (currentIndex === totalSlides - 1) ? 0 : currentIndex + 1;
    slider.style.transform = `translateX(-${currentIndex * 100}%)`;
};