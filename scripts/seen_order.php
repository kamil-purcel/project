<?php
session_start();
require_once "./connect.php";

try {
    $stmt = $conn->prepare("UPDATE rental SET userSeen = 1 WHERE id = ?;");
    $stmt->bind_param("i", $_POST["id"]);
    $stmt->execute();
} catch (mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}
echo "<script>history.back();</script>";
exit();