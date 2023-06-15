<?php
session_start();

if (!isset($_SESSION["logged"]) || session_status() != 2) {
    $_SESSION["error"] = "Please login!";
    header("location: ../../");
}
if (isset($_SESSION["logged"]["lastActivity"])) {
    $lastActivityTime = $_SESSION["logged"]["lastActivity"];
    $currentTime = time();
    $sessionTimeout = 60;

    if ($currentTime - $lastActivityTime > $sessionTimeout) {
        $_SESSION["error"] = "Session has expired!";
        unset($_SESSION["logged"]);
        header("location: ../../");
        exit();
    }
    $_SESSION["logged"]["lastActivity"] = $currentTime;
} else {
    $_SESSION["error"] = "Session has expired or is not active!";
    header("location: ../../");
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library - Update book</title>
    <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">

    <?php
    if (isset($_SESSION["error"])) {
        echo <<< ERROR
        <div class="callout callout-danger">
          <h5>Error!</h5>
          <p>$_SESSION[error]</p>
        </div>
ERROR;
        unset($_SESSION["error"]);
    }
    ?>

    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <h1><b>Edit book</b></h1>
        </div>
        <div class="card-body">

            <?php

            require_once "../../../scripts/connect.php";

            try {
                $stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
                $stmt->bind_param("s", $_SESSION["editBookIsbn"]);
                $stmt->execute();
                $result = $stmt->get_result();
                $book = $result->fetch_assoc();

                if ($result->num_rows != 0) {
                    echo <<< UPDATEBOOKFORM
            <form action="../../../scripts/update_book.php" method="post">
ISBN
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="ISBN" name="isbn" value="$book[isbn]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-book"></span>
                        </div>
                    </div>
                </div>
Title
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Title" name="title" value="$book[title]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-book"></span>
                        </div>
                    </div>
                </div>
Authors
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Authors" name="authors" value="$book[authors]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user-friends"></span>
                        </div>
                    </div>
                </div>
Publisher
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Publisher" name="publisher" value="$book[publisher]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user-friends"></span>
                        </div>
                    </div>
                </div>
Published Date
                <div class="input-group mb-3">
                    <input type="date" class="form-control" name="published_date" value="$book[published_date]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-calendar"></span>
                        </div>
                    </div>
                </div>
Category
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Category" name="category" value="$book[category]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-icons"></span>
                        </div>
                    </div>
                </div>
Pages
                <div class="input-group mb-3">
                
                    <input type="text" class="form-control" placeholder="Pages" name="pages" value="$book[pages]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-book-open"></span>
                        </div>
                    </div>
                </div>
Image
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Image" name="image" value="$book[image]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-icons"></span>
                        </div>
                    </div>
                </div>
                Description
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Description" name="description" value="$book[description]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-icons"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-8">
            <a href="../logged.php" class="text-center">Discard changes</a>
                    
                    </div>
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">Update</button>
                    </div>
                </div>
            </form>
UPDATEBOOKFORM;
                }
            } catch (mysqli_sql_exception $error) {
                $_SESSION["error"] = $error->getMessage();
                echo "<script>history.go(-2);</script>";
                exit();
            }
            ?>
        </div>
    </div>
</div>
</body>
</html>