$(document).ready(function () {
  //if local storage has username and password
  if (localStorage.getItem("username") && localStorage.getItem("password")) {
    //if username and password are correct
    if (
      localStorage.getItem("username") == "admin" &&
      localStorage.getItem("password") == "admin"
    ) {
      $.ajax({
        type: "get",
        url: "https://www.cozydesign.net/ogrencilistele.php",
        dataType: "json",
        beforeSend: function () {
          let dizi = [
            [1, "SÜMEYYE AKCA", "16008118064", "65"],
            [2, "ZEKİ ARSLAN", "16008118058", "57"],
            [3, "FERDİ AYDOĞDU", "16008118011", "86"],
            [4, "BEYZA NUR ÇAM", "16008118030", "92"],
            [5, "ÇAĞRI CANDAN", "16008118006", "35"],
          ];

          let html = "";
          let ort = 0;
          for (let i = 0; i < dizi.length; i++) {
            ort += parseInt(dizi[i][3]);

            html += "<tr>";
            html += "<td>" + dizi[i][0] + "</td>";
            html += "<td>" + dizi[i][1] + "</td>";
            html += "<td>" + dizi[i][2] + "</td>";
            html += "<td>" + dizi[i][3] + "</td>";
            html += "</tr>";
          }
          ort = ort / dizi.length;

          $("#out").append(html);
          $("#ort").append(ort);
        },
        success: function (response) {
          //cors hatası alınmıştır.
        },
      });
    }
  }
  else {
    //location href to login.html
    window.location.href = "http://127.0.0.1:5501/components/login.html";
    alert("Lütfen giriş yapınız");
  }
});
