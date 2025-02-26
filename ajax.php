<?php
include "env.php";

$conn = mysqli_connect($host, $user, $passwd, $db);
if (mysqli_connect_errno()) {
    printf("Connection error:", mysqli_connect_error());
    exit(1);
}
$sql = "SELECT * FROM monetki INNER JOIN panstwa ON monetki.country_id=panstwa.country_id INNER JOIN stopy ON monetki.alloy_id=stopy.alloy_id";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) < 1) {
    printf("Error: ", mysqli_error($conn));
    exit(1);
}
$rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
echo json_encode($rows);

mysqli_close($conn);
