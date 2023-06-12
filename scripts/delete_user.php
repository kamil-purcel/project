<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    $ipAddress = $_SERVER["REMOTE_ADDR"];
    try {
        $stmt = $conn->prepare("SELECT * FROM users WHERE id=?");
        $stmt->bind_param("i", $_POST["deletedUserId"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        if ($result->num_rows != 0) {
            $userEmail = $user["email"];

            $sql = "DELETE FROM users WHERE id = $_POST[deletedUserId];";
            $conn->query($sql);

            if ($conn->affected_rows == 1) {
                $status = 7;
                $sql = "INSERT INTO logs  (email, status, IPAddress) VALUES (?, ?, ?);";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("sss", $userEmail, $status, $ipAddress);
                $stmt->execute();
                $_SESSION["success"] = "The user has been removed";
            } else {
                $status = 8;
                $sql = "INSERT INTO logs (status, IPAddress) VALUES ( ?, ?);";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ss", $status, $ipAddress);
                $stmt->execute();
                $_SESSION["error"] = "Deleting user failed!";
            }
        }else{
            $status = 8;
            $sql = "INSERT INTO logs (status, IPAddress) VALUES ( ?, ?);";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $status, $ipAddress);
            $stmt->execute();
            $_SESSION["error"] = "Deleting user failed!";
        }
    } catch (mysqli_sql_exception $error) {
        $status = 9;
        $sql = "INSERT INTO logs (status, IPAddress) VALUES ( ?, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $status, $ipAddress);
        $stmt->execute();
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.go(-2);</script>";
        exit();
    }
}
header("location: ../pages/view/logged.php");