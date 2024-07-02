function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return null;
}
document.addEventListener("htmx:configRequest", (event) => {
    const token = getCookie('token');
    if (token !== null)
        event.detail.headers['Authorization'] = `Bearer ${token}`;
});

document.getElementById("newsContainer").addEventListener("htmx:afterSwap", (event) => {
    let totalSlides = 3
    let currentIndex = 0
    document.getElementById('newsLeftBtn').onclick = () => {
        currentIndex = (currentIndex === 0) ? totalSlides - 1 : currentIndex - 1;
        document.getElementById('news').style.transform = `translateX(-${currentIndex * 100}%)`;
    };

    document.getElementById('newsRightBtn').onclick = () => {
        currentIndex = (currentIndex === totalSlides - 1) ? 0 : currentIndex + 1;
        document.getElementById('news').style.transform = `translateX(-${currentIndex * 100}%)`;
    };
})

function submitLogin(e) {
    window.location.redirect = "/";
}
