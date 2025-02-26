const resolveUrl = (url) => location.href + (url.startsWith("/") ? url.slice(1) : url);

const get = () => {
  const table = document.querySelector("tbody");
  table.innerHTML = "";

  fetch("allSelectable.php")
    .then((res) => res.json())
    .then((data) => console.log(data));

  fetch("ajax.php")
    .then((res) => res.json())
    .then((data) => {
      data.forEach((coin) => {
        const tr = document.createElement("tr");

        const img = new Image();
        img.src = resolveUrl(coin.flag_image);
        tr.appendChild(img);

        [coin.nominal, coin.catalog_number, coin.alloy_name, coin.year].forEach((text) => {
          console.log(text);
          const td = document.createElement("td");
          td.textContent = text;
          tr.appendChild(td);
        });

        table.appendChild(tr);
      });
    });
};
