<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    $ipAddress = $_SERVER["REMOTE_ADDR"];
    try {

        $sql = "DELETE FROM books WHERE isbn = $_POST[deletedBookIsbn];";
        $conn->query($sql);

        if ($conn->affected_rows == 1) {
            $_SESSION["success"] = "The book has been removed";
        } else {
            $_SESSION["error"] = "Deleting book failed!";
        }
    } catch
    (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.go(-2);</script>";
        exit();
    }
}
header("location: ../pages/view/logged.php");

## add some comments 