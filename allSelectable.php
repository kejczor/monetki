<?php
include "env.php";

$conn = mysqli_connect($host, $user, $passwd, $db);
if (mysqli_connect_errno()) {
  printf("Connection error:", mysqli_connect_error());
  exit(1);
}

$country_sql = "SELECT panstwa.country_name FROM panstwa";
$country_result = mysqli_query($conn, $country_sql);
if (mysqli_num_rows($country_result) < 1) {
  printf("Error: ", mysqli_error($conn));
  exit(1);
}
$country_names = array_column(mysqli_fetch_all($country_result, MYSQLI_NUM), 0);


$alloy_sql = "SELECT stopy.alloy_name FROM stopy";
$alloy_result = mysqli_query($conn, $alloy_sql);
if (mysqli_num_rows($alloy_result) < 1) {
  printf("Error: ", mysqli_error($conn));
  exit(1);
}
$alloy_names = array_column(mysqli_fetch_all($alloy_result, MYSQLI_NUM), 0);


$json = array("countries" => $country_names, "alloys" => $alloy_names);

echo json_encode($json);

mysqli_close($conn);
