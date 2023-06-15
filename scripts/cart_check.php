<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    try {
        if (isset($_SESSION['cart'])) {
            foreach ($_SESSION['cart'] as $book) {
                if ($book["isbn"] == $_POST["isbn"]) {
                    $_SESSION["error"] = "You cannot have two the same books in your cart!";
                    echo "<script>history.back();</script>";
                    exit();
                }
            }
        }

        $stmt = $conn->prepare("SELECT * FROM rental r INNER JOIN rental_info ri on r.id = ri.id INNER JOIN books b on ri.isbn = b.isbn  WHERE r.userId = ? and ri.isbn = ? and ((ri.accept = 1 and ri.returnDate is null) or (ri.accept is null))");
        $stmt->bind_param("is", $_SESSION["logged"]["id"], $_POST["isbn"]);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows == 0) {
            $stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
            $stmt->bind_param("s", $_POST["isbn"]);
            $stmt->execute();
            $result = $stmt->get_result();
            $book = $result->fetch_assoc();

            if ($result->num_rows != 0) {
                $bookISBN = $book["isbn"];
                $bookTitle = $book["title"];

                $bookInfo = [
                    'isbn' => $bookISBN,
                    'title' => $bookTitle,
                ];

                $_SESSION['cart'][] = $bookInfo;

                echo "<script>history.back();</script>";
                exit();
            } else {
                $_SESSION["error"] = "Could not add book to cart!";
                echo "<script>history.back();</script>";
                exit();
            }
        } else {
            $_SESSION["error"] = "You already borrowed this book!";
            echo "<script>history.back();</script>";
            exit();
        }
    } catch
    (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.back();</script>";
        exit();
    }
}


