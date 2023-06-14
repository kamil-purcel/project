<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    try {
        if (isset($_SESSION['cart'])) {
            $stmt = $conn->prepare("INSERT INTO rental (userId) VALUES (?);");
            $stmt->bind_param("i", $_SESSION["logged"]["id"]);
            $stmt->execute();

            if ($stmt->affected_rows == 1) {
                $stmt = $conn->prepare("SELECT id FROM rental WHERE userId=? order by id desc limit 1");
                $stmt->bind_param("i", $_SESSION["logged"]["id"]);
                $stmt->execute();
                $result = $stmt->get_result();
                $orderID = $result->fetch_assoc();
                if ($result->num_rows != 0) {
                    foreach ($_SESSION['cart'] as $bookInfo) {
                        $stmt = $conn->prepare("INSERT INTO rental_info (id, isbn) VALUES (?, ?);");
                        $stmt->bind_param("is", $orderID["id"], $bookInfo["isbn"]);
                        $stmt->execute();
                        if ($stmt->affected_rows != 1) {
                            $_SESSION["error"] = "Could not order the book!";
                            echo "<script>history.back();</script>";
                            exit();
                        }
                    }

                } else {
                    $_SESSION["error"] = "Could not order the book!";
                    echo "<script>history.back();</script>";
                    exit();
                }

            } else {
                $_SESSION["error"] = "Could not order the book!";
                echo "<script>history.back();</script>";
                exit();
            }
        }
        $_SESSION["success"] = "Order done";
        if (isset($_SESSION['cart'])) {
            unset($_SESSION['cart']);
        }
    } catch (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.back();</script>";
        exit();
    }
}
header("location: ../pages/view/logged.php");



