async function btnLoginPressed() {
    let username = document.getElementById("username").value;
    if (username == "") {
    }

    let password = document.getElementById("password").value;
    if (password == "") {
    }

    let container = document.getElementById("container");

    let request = await fetch("/login/auth", { method: "POST", headers: { "Content-type": "application/json; charset=UTF-8" }, body: JSON.stringify({ username: username, password: password }) });
    let response = await request.text();
    container.innerHTML = await response;
}
