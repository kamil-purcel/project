<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();

    foreach ($_POST as $value) {
        if (empty($value)) {
            $_SESSION["error"] = "Fill all fields!";
            echo "<script>history.go(-2);</script>";
            exit();
        }
    }

    $error = 0;
    if ($_POST["password"] != $_POST["re-password"]) {
        $error = 1;
        $_SESSION["error"] .= "The password confirmation does not match!<br>";
    }

    if (!preg_match('/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\d\s])\S{8,}/', $_POST["password"])) {
        $error = 1;
        $_SESSION["error"] .= "The password does not meet the requirements!<br>";
    }
    $ipAddress = $_SERVER["REMOTE_ADDR"];
    require_once "./connect.php";

    if ($error != 0) {
        $status = 6;
        $sql = "INSERT INTO logs (email, status, IPAddress) VALUES (?, ?, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $_POST["email"], $status, $ipAddress);
        $stmt->execute();
        echo "<script>history.go(-2);</script>";
        exit();
    }

    try {
        if (defined('PASSWORD_ARGON2ID')) {
            $pass = password_hash($_POST["password"], PASSWORD_ARGON2ID);
        } else {
            $pass = password_hash($_POST["password"], PASSWORD_DEFAULT);
        }

        $sql = "UPDATE users SET password = '$pass' WHERE email = '$_POST[email]';";
        $conn->query($sql);

        if ($conn->affected_rows == 1) {
            $stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
            $stmt->bind_param("s", $_POST["email"]);
            $stmt->execute();
            $result = $stmt->get_result();
            $user = $result->fetch_assoc();

            if ($result->num_rows != 0) {
            $status = 5;
            $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
            $stmt = $conn->prepare($sql);

            $stmt->bind_param("isss", $user["id"], $_POST["email"], $status, $ipAddress);
            $stmt->execute();
            $_SESSION["success"] = "Password has been changed";
            }else{
                $status = 6;
                $sql = "INSERT INTO logs (email, status, IPAddress) VALUES (?, ?, ?);";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("sss", $_POST["email"], $status, $ipAddress);
                $stmt->execute();
                $_SESSION["error"] = "Password change failed!";
            }
        } else {
            $status = 6;
            $sql = "INSERT INTO logs (email, status, IPAddress) VALUES (?, ?, ?);";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $_POST["email"], $status, $ipAddress);
            $stmt->execute();
            $_SESSION["error"] = "Password change failed!";
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
header("location: ../pages");