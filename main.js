const resolveUrl = (url) => location.href + (url.startsWith("/") ? url.slice(1) : url);

let countries = [];
let alloys = [];
let editingId = null;

const getSelectable = () => {
  fetch("allSelectable.php")
    .then((res) => res.json())
    .then((data) => {
      const countrySelect = document.querySelector("#country-select");
      countries = data.countries;
      data.countries.forEach((country) => {
        const option = document.createElement("option");
        option.textContent = country.country_name;
        option.value = country.country_id;
        countrySelect.appendChild(option);
      });

      const alloySelect = document.querySelector("#alloy-select");
      alloys = data.alloys;
      data.alloys.forEach((alloy) => {
        const option = document.createElement("option");
        option.textContent = alloy.alloy_name;
        option.value = alloy.alloy_id;
        alloySelect.appendChild(option);
      });
    });
};

const getCoins = () => {
  const table = document.querySelector("tbody");
  table.innerHTML = "";

  fetch("ajax.php")
    .then((res) => res.json())
    .then((data) => {
      data.forEach((coin) => {
        const tr = document.createElement("tr");
        tr.setAttribute("data-id", coin.id);
        const img = new Image();
        img.src = resolveUrl(coin.flag_image);
        img.setAttribute("data-country", coin.country_id);
        img.onclick = () => editCoin(tr.dataset.id);
        tr.appendChild(img);

        const aaa = ["nominal", "catalog_number", "alloy_name", "year"].map((key) => [key, coin[key]]);

        aaa.forEach(([key, text]) => {
          const td = document.createElement("td");
          td.textContent = text;
          td.setAttribute("data-key", key);
          tr.appendChild(td);
        });

        const td = document.createElement("td");
        const deleteButton = document.createElement("button");
        deleteButton.type = "button";
        const deleteIcon = document.createElement("img");
        deleteIcon.src = "gfx/delete.gif";
        deleteButton.append(deleteIcon);
        deleteButton.onclick = () => deleteCoin(tr.dataset.id);
        td.appendChild(deleteButton);
        tr.appendChild(td);

        table.appendChild(tr);
      });
    })
    .catch((e) => console.error(e));
};

const getAll = () => {
  getSelectable();
  getCoins();
};

const postNewCoin = (urlEncodedData) => {
  fetch("ajax.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: urlEncodedData.toString(),
  })
    .then((res) => res.json())
    .then((data) => {
      if (data.success === true) {
        getCoins();
      } else {
        throw data;
      }
    })
    .catch((e) => console.error(e));
};

const handleSubmit = (e) => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const urlEncodedData = new URLSearchParams();
  for (const [key, value] of formData.entries()) {
    urlEncodedData.append(key, value);
  }

  if (editingId !== null) {
    const createButton = document.querySelector("#create-button");
    createButton.disabled = false;
    postEditedCoin(urlEncodedData);
    editingId = null;
  } else {
    postNewCoin(urlEncodedData);
  }

  e.target.reset();
};

const deleteCoin = (id) => {
  fetch(`ajax.php?delete=${id}`)
    .then((res) => res.json())
    .then((data) => {
      if (data.success === true) {
        getCoins();
      } else {
        throw data;
      }
    })
    .catch((e) => console.error(e));
};

const editCoin = (id) => {
  const createButton = document.querySelector("#create-button");
  createButton.disabled = true;

  const tr = document.querySelector(`tr[data-id="${id}"]`);
  editingId = id;

  const countrySelect = document.createElement("select");
  countrySelect.name = "edit_country_id";
  countries.forEach((country) => {
    const option = document.createElement("option");
    option.textContent = country.country_name;
    option.value = country.country_id;
    option.defaultSelected = tr.querySelector(`*:nth-child(1)`).dataset.country === country.country_id;
    countrySelect.appendChild(option);
  });

  const nominal = document.createElement("input");
  nominal.name = "edit_nominal";
  nominal.value = tr.querySelector("*:nth-child(2)").textContent;

  const catalog_number = document.createElement("input");
  catalog_number.name = "edit_catalog_number";
  catalog_number.value = tr.querySelector("*:nth-child(3)").textContent;

  const alloySelect = document.createElement("select");
  alloySelect.name = "edit_alloy_id";
  alloys.forEach((alloy) => {
    const option = document.createElement("option");
    option.textContent = alloy.alloy_name;
    option.value = alloy.alloy_id;
    option.selected = tr.querySelector(`*:nth-child(4)`).textContent === alloy.alloy_name;
    alloySelect.appendChild(option);
  });

  const year = document.createElement("input");
  year.name = "edit_year";
  year.type = "number";
  year.value = tr.querySelector("*:nth-child(5)").textContent;

  const editButton = document.createElement("button");
  editButton.type = "submit";
  const confirmIcon = document.createElement("img");
  confirmIcon.src = "gfx/confirm.png";
  editButton.append(confirmIcon);

  tr.innerHTML = "";
  [countrySelect, nominal, catalog_number, alloySelect, year, editButton].forEach((el) => {
    const td = document.createElement("td");
    td.append(el);
    tr.append(td);
  });
};

const postEditedCoin = (urlEncodedData) => {
  fetch(`ajax.php?edit=${editingId}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: urlEncodedData.toString(),
  })
    .then((res) => res.json())
    .then((data) => {
      console.log(data);
      if (data.success === true) {
        getCoins();
      } else {
        throw data;
      }
    })
    .catch((e) => console.error(e));
};
