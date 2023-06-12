<?php
session_start();

$error = 0;
if (!empty($_POST["password"])) {
    if (!preg_match('/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\d\s])\S{8,}/', $_POST["password"])) {
        $error = 1;
        $_SESSION["error"] .= "The password does not meet the requirements!<br>";
    }
}

if (empty($_POST["email"])) {
    $error = 1;
    $_SESSION["error"] .= "Email cannot be empty!<br>";
}

require_once "./connect.php";
$stmt = $conn->prepare("SELECT * FROM users WHERE email=? and id!=?");
$stmt->bind_param("si", $_POST["email"], $_POST["userId"]);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
if ($result->num_rows != 0) {
    $error = 1;
    $_SESSION["error"] = "The email has already been taken!<br>";
}

if (empty($_POST["firstName"])) {
    $error = 1;
    $_SESSION["error"] .= "First name cannot be empty!<br>";
}

if (empty($_POST["lastName"])) {
    $error = 1;
    $_SESSION["error"] .= "Last name cannot be empty!<br>";
}
if (empty($_POST["birthday"])) {
    $error = 1;
    $_SESSION["error"] .= "Birthday cannot be empty!<br>";
}
$ipAddress = $_SERVER["REMOTE_ADDR"];

if ($error != 0) {
    $status = 6;
    $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
    $stmt = $conn->prepare($sql);

    $stmt->bind_param("isss", $_POST["userId"], $_POST["email"], $status, $ipAddress);
    $stmt->execute();
    echo "<script>history.back();</script>";
    exit();
}

try {

    $stmt = $conn->prepare("UPDATE users SET permissionId = ?, email = ?, firstName = ?, lastName = ?, birthday = ?, image = ? WHERE id = $_POST[userId];");

    $stmt->bind_param("isssss", $_POST["permissionId"], $_POST["email"], $_POST["firstName"], $_POST["lastName"], $_POST["birthday"], $_POST["image"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        if (empty($_POST["password"])) {
            $status = 5;
            $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
            $stmt = $conn->prepare($sql);

            $stmt->bind_param("isss", $_POST["userId"], $_POST["email"], $status, $ipAddress);
            $stmt->execute();
        }
        $_SESSION["success"] = "The user $_POST[firstName] $_POST[lastName] has been updated";
    } else {
        if (empty($_POST["password"])) {
            $status = 6;
            $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
            $stmt = $conn->prepare($sql);

            $stmt->bind_param("isss", $_POST["userId"], $_POST["email"], $status, $ipAddress);
            $stmt->execute();
        }
        $_SESSION["error"] = "Failed to update user!";
    }

    if (!empty($_POST["password"])) {
        if (defined('PASSWORD_ARGON2ID')) {
            $pass = password_hash($_POST["password"], PASSWORD_ARGON2ID);
        } else {
            $pass = password_hash($_POST["password"], PASSWORD_DEFAULT);
        }
        $stmt = $conn->prepare("UPDATE users SET password = ? WHERE id = $_POST[userId];");

        $stmt->bind_param("s", $pass);
        $stmt->execute();
        if ($stmt->affected_rows == 1) {
            $status = 5;
            $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
            $stmt = $conn->prepare($sql);

            $stmt->bind_param("isss", $_POST["userId"], $_POST["email"], $status, $ipAddress);
            $stmt->execute();
            $_SESSION["success"] = "The user $_POST[firstName] $_POST[lastName] has been updated";
            unset($_SESSION["error"]);
        } else {
            $status = 6;
            $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
            $stmt = $conn->prepare($sql);

            $stmt->bind_param("isss", $_POST["userId"], $_POST["email"], $status, $ipAddress);
            $stmt->execute();
            $_SESSION["error"] = "Failed to update user!";
        }
    }
} catch (mysqli_sql_exception $error) {
    $status = 9;
    $sql = "INSERT INTO logs (status, IPAddress) VALUES ( ?, ?);";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $status, $ipAddress);
    $stmt->execute();
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}

header("location: ../pages/view/logged.php");