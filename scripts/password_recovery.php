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

    if ($error != 0) {
        echo "<script>history.go(-2);</script>";
        exit();
    }

    require_once "./connect.php";
    try {
        if (defined('PASSWORD_ARGON2ID')) {
            $pass = password_hash($_POST["password"], PASSWORD_ARGON2ID);
        } else {
            $pass = password_hash($_POST["password"], PASSWORD_DEFAULT);
        }

        $sql = "UPDATE users SET password = '$pass' WHERE email = '$_POST[email]';";
        $conn->query($sql);

        if ($conn->affected_rows == 1) {
            $_SESSION["success"] = "Password has been changed";
        } else {
            $_SESSION["error"] = "Password change failed!";
        }
    } catch (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.go(-2);</script>";
        exit();
    }
}
header("location: ../pages");