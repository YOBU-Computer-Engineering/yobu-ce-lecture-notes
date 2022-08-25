//if local storage has username and password
if (localStorage.getItem("username") && localStorage.getItem("password")) {
  //if username and password are correct
  if (
    localStorage.getItem("username") == "admin" &&
    localStorage.getItem("password") == "admin"
  ) {
  } else {
        //location href to login.html
        alert("Lütfen giriş yapınız");
        window.location.href = "http://127.0.0.1:5501/components/login.html";
  }
}
