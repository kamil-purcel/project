<?php
session_start();


if (empty($_POST["firstName"]) or
    empty($_POST["lastName"]) or
    empty($_POST["email"]) or
    empty($_POST["password"]) or
    empty($_POST["re-password"]) or
    empty($_POST["birthday"]) or
    empty($_POST["permissionId"])) {
    $_SESSION["error"] = "Fill all fields!";
    echo "<script>history.back();</script>";
    exit();
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

require_once "./connect.php";
$stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
$stmt->bind_param("s", $_POST["email"]);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
if ($result->num_rows != 0) {
    $error = 1;
    $_SESSION["error"] = "The email has already been taken!<br>";
}

if ($error != 0) {
    echo "<script>history.back();</script>";
    exit();
}

try {
    $stmt = $conn->prepare("INSERT INTO users (email, firstName, lastName, birthday, password, createdAt, image) VALUES (?, ?, ?, ?, ?, current_timestamp(), ?);");
    if (defined('PASSWORD_ARGON2ID')) {
        $pass = password_hash($_POST["password"], PASSWORD_ARGON2ID);
    } else {
        $pass = password_hash($_POST["password"], PASSWORD_DEFAULT);
    }
    $stmt->bind_param("ssssss", $_POST["email"], $_POST["firstName"], $_POST["lastName"], $_POST["birthday"], $pass, $_POST["image"]);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $_SESSION["success"] = "The user $_POST[firstName] $_POST[lastName] has been added";
    } else {
        $_SESSION["error"] = "Failed to add user!";
    }
} catch (mysqli_sql_exception $error) {
    $_SESSION["error"] = $error->getMessage();
    echo "<script>history.back();</script>";
    exit();
}

header("location: ../pages/view/logged.php");