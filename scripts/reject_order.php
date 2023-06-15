<?php
session_start();
require_once "./connect.php";

try {
    $stmt = $conn->prepare("UPDATE rental_info SET accept = 0 WHERE id = ? and isbn = ?;");
    $stmt->bind_param("is", $_POST["rentalID"],$_POST["rentalISBN"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $stmt = $conn->prepare("SELECT * FROM rental_info WHERE id = ? and accept is null; ");
        $stmt->bind_param("i", $_POST["rentalID"]);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows == 0) {
            $stmt = $conn->prepare("UPDATE rental SET seen = 1 WHERE id = ?;");
            $stmt->bind_param("i", $_POST["rentalID"]);
            $stmt->execute();
        }
        $_SESSION["success"] = "The order $_POST[rentalID], ISBN: $_POST[rentalISBN] has been rejected";
    } else {
        $_SESSION["error"] = "Failed to reject order!";
    }
} catch (mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}
echo "<script>history.back();</script>";
exit();