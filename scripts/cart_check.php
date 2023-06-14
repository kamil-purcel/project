<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    require_once "./connect.php";
    try {
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
        }

    } catch (mysqli_sql_exception $error) {
        $_SESSION["error"] = $error->getMessage();
        echo "<script>history.back();</script>";
        exit();
    }
}


