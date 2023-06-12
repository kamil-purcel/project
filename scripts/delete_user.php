<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    try {
        $sql = "DELETE FROM users WHERE id = $_POST[deletedUserId];";
        $conn->query($sql);

        if ($conn->affected_rows == 1) {
            $_SESSION["success"] = "The user has been removed";
        } else {
            $_SESSION["error"] = "Deleting user failed!";
        }
    } catch (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.go(-2);</script>";
        exit();
    }
}
header("location: ../pages/view/logged.php");