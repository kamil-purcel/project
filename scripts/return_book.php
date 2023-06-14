<?php
session_start();
require_once "./connect.php";

try {
    $stmt = $conn->prepare("UPDATE rental_info SET returnDate = current_timestamp() WHERE id = ? and isbn = ?;");
    $stmt->bind_param("is", $_POST["rentalID"],$_POST["rentalISBN"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $_SESSION["success"] = "The order $_POST[rentalID], ISBN: $_POST[rentalISBN] has been returned";
    } else {
        $_SESSION["error"] = "Failed to return book!";
    }
} catch (mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}
echo "<script>history.back();</script>";
exit();