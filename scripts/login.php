<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();

    foreach ($_POST as $value) {
        if (empty($value)) {
            $_SESSION["error"] = "Fill all fields!";
            echo "<script>history.back();</script>";
            exit();
        }
    }

    require_once "./connect.php";
    $ipAddress = $_SERVER["REMOTE_ADDR"];
    try {
        $stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
        $stmt->bind_param("s", $_POST["email"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($result->num_rows != 0) {
            if (password_verify($_POST["password"], $user["password"])) {
                $_SESSION["logged"]["firstName"] = $user["firstName"];
                $_SESSION["logged"]["lastName"] = $user["lastName"];
                $_SESSION["logged"]["permissionId"] = $user["permissionId"];
                $_SESSION["logged"]["image"] = $user["image"];
                $_SESSION["logged"]["sessionId"] = session_id();
                $_SESSION["logged"]["lastActivity"] = time();
                $status = 1;
                $sql = "INSERT INTO logs (userId, email, status, IPAddress) VALUES (?,?, ?, ?);";
                $stmt = $conn->prepare($sql);

                $stmt->bind_param("isss", $user["id"], $user["email"], $status, $ipAddress);
                $stmt->execute();

                header("location: ../pages/view/logged.php");
                exit();
            } else {
                $status = 2;
                $sql = "INSERT INTO logs (userId,email, status, IPAddress) VALUES (?,?, ?, ?);";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("isss", $user["id"],$user["email"], $status, $ipAddress);
                $stmt->execute();
            }
        } else {
            $status = 2;
            $sql = "INSERT INTO logs (email, status, IPAddress) VALUES (?, ?, ?);";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $_POST["email"], $status, $ipAddress);
            $stmt->execute();
        }
        $status = 2;
        $sql = "INSERT INTO logs (email, status, IPAddress) VALUES (?, ?, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $_POST["email"],$status, $ipAddress);
        $stmt->execute();
        $_SESSION["error"] = "Incorrect login or password!";
        echo "<script>history.back();</script>";
        exit();


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
}
header("location: ../pages/register.php");