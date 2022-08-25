$(document).ready(function () {

  $("#login").click(function () {
    var username = $("#username").val();
    var password = $("#password").val();
    if (username == "admin" && password == "admin") {
        //local storage save
        localStorage.setItem("username", username);
        localStorage.setItem("password", password);
        window.location.href = "http://127.0.0.1:5501/components/tanitim.html";
    } else {
      alert("Geçersiz kullanıcı adı şifre");
    }
  });
});
