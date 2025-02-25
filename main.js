function send() {
  const xhttp = new XMLHttpRequest();
  let imie = encodeURIComponent(document.getElementById("imie").value);
  xhttp.open("POST", "ajax.php");

  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      get();
    }
  };

  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("acc=add&imie=" + imie);
}

const get = () => {
  const table = document.querySelector("tbody");
  table.innerHTML = "";

  fetch("ajax.php")
    .then((res) => res.json())
    .then((data) => {
      console.log(data);
      data.forEach((coin) => {
        const row = document.createElement("tr");
      });
    });
};

const url = new URL("/gfx/albania.jpg", location.href);
