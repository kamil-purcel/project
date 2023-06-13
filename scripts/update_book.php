<?php
session_start();

$error = 0;
foreach ($_POST as $value) {
    if (empty($value)) {
        $_SESSION["error"] = "Fill all fields!";
        echo "<script>history.back();</script>";
        exit();
    }
}

require_once "./connect.php";
if ($_SESSION["editBookIsbn"] != $_POST["isbn"]) {
    $stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
    $stmt->bind_param("s", $_POST["isbn"]);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    if ($result->num_rows != 0) {
        $error = 1;
        $_SESSION["error"] = "The isbn has already been taken!<br>";
    }
}

if ($error != 0) {
    echo "<script>history.back();</script>";
    exit();
}


try {
    $stmt = $conn->prepare("UPDATE books SET isbn = ?, title = ?, authors = ?, publisher = ?, published_date = ?, category = ?, pages = ? WHERE isbn = $_SESSION[editBookIsbn];");
    $stmt->bind_param("sssssss", $_POST["isbn"], $_POST["title"], $_POST["authors"], $_POST["publisher"], $_POST["published_date"], $_POST["category"], $_POST["pages"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $_SESSION["success"] = "The book $_SESSION[editBookIsbn] --> $_POST[title] has been updated";
    } else {
        $_SESSION["error"] = "Failed to update book!";
    }
} catch (mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}

header("location: ../pages/view/logged.php");