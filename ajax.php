<?php
include "env.php";

$conn = mysqli_connect($host, $user, $passwd, $db);
if (mysqli_connect_errno()) {
    printf("Connection error:", mysqli_connect_error());
    exit(1);
}

if (
    isset($_GET['edit']) and
    isset($_POST['edit_country_id']) and
    isset($_POST['edit_nominal']) and
    isset($_POST['edit_catalog_number']) and
    isset($_POST['edit_alloy_id']) and
    isset($_POST['edit_year'])
) {
    $sql = 'UPDATE `monetki` SET `country_id`=?, `nominal`=?, `catalog_number`=?, `alloy_id`=?, `year`=? WHERE id=?';
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'issiii', $_POST['edit_country_id'], $_POST['edit_nominal'], $_POST['edit_catalog_number'], $_POST['alloy_id'], $_POST['year'], $_GET['edit']);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    echo json_encode(['success' => true, 'message' => 'edited']);
} else if (
    isset($_POST['country_id']) and
    isset($_POST['nominal']) and
    isset($_POST['catalog_number']) and
    isset($_POST['alloy_id']) and
    isset($_POST['year'])
) {
    $sql = "INSERT INTO `monetki` (`id`, `country_id`, `nominal`, `catalog_number`, `alloy_id`, `year`) VALUES (NULL, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "issii", $_POST["country_id"], $_POST["nominal"], $_POST["catalog_number"], $_POST["alloy_id"], $_POST["year"]);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    echo json_encode(["success" => true, "message" => "created"]);
} else if (isset($_GET['delete'])) {
    $sql = 'DELETE FROM `monetki` WHERE id = ?';
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $_GET['delete']);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    echo json_encode(['success' => true, 'message' => '']);
} else {
    $sql = "SELECT * FROM monetki INNER JOIN panstwa ON monetki.country_id=panstwa.country_id INNER JOIN stopy ON monetki.alloy_id=stopy.alloy_id";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) < 1) {
        printf("Error: ", mysqli_error($conn));
        exit(1);
    }
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($rows);
}
mysqli_close($conn);
