<?php
session_start();

foreach ($_POST as $value) {
    if (empty($value)) {
        $_SESSION["error"] = "Fill all fields!";
        echo "<script>history.back();</script>";
        exit();
    }
}

$error = 0;
require_once "./connect.php";
$stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
$stmt->bind_param("s", $_POST["isbn"]);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
if ($result->num_rows != 0) {
    $error = 1;
    $_SESSION["error"] = "The isbn has already been taken!<br>";

}

if ($error != 0) {
    echo "<script>history.back();</script>";
    exit();
}

try {
    $stmt = $conn->prepare("INSERT INTO books (isbn, title, authors, publisher, published_date, category, pages, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
    $stmt->bind_param("ssssssss", $_POST["isbn"], $_POST["title"], $_POST["authors"], $_POST["publisher"], $_POST["published_date"], $_POST["category"], $_POST["pages"], $_POST["image"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $_SESSION["success"] = "The book $_POST[isbn] --> $_POST[title] has been added";
    } else {
        $_SESSION["error"] = "Failed to add book!";

    }
} catch
(mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}

header("location: ../pages/view/logged.php");