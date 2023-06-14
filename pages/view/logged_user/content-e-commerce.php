<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Book details</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Book details</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <?php

        require_once "../../scripts/connect.php";
        try {
            $stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
            $stmt->bind_param("s", $_SESSION["isbn"]);
            $stmt->execute();
            $result = $stmt->get_result();
            $book = $result->fetch_assoc();

            if ($result->num_rows == 0) {
                $_SESSION["error"] = "Book not found!";
                echo "<script>history.back();</script>";
                exit();
            }
        } catch (mysqli_sql_exception $error) {
            $_SESSION["error"] = $error->getMessage();
            echo "<script>history.back();</script>";
            exit();
        }
        ?>
        <div class="card card-solid">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 col-sm-3">
                        <div class="col-12">
                            <?php
                            echo '<img src="../../dist/img/covers/' . $book["image"] . '" class="product-image" alt="Book cover">';
                            ?>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6">
                        <?php
                        echo "<h3 class=my-3> $book[title] </h3>";
                        echo <<< INFO
<table>
  <tr>
    <td class="first-column">Authors:</td>
INFO;
                        if (empty($book["authors"])) {
                            echo "<td>No data</td>";
                        } else {
                            echo "<td>$book[authors]</td>";
                        }
                        echo <<< INFO
  </tr>
  <tr>
    <td class="first-column">Publisher:</td>
INFO;
                        if (empty($book["published_date"])) {
                            echo "<td>No data</td>";
                        } else {
                            echo "<td>$book[published_date]</td>";
                        }
                        echo <<< INFO
  </tr>
  <tr>
    <td class="first-column">Published date:</td>
INFO;
                        if (empty($book["publisher"])) {
                            echo "<td>No data</td>";
                        } else {
                            echo "<td>$book[publisher]</td>";
                        }
                        echo <<< INFO
  </tr>
  <tr>
    <td class="first-column">Pages:</td>
INFO;
                        if (empty($book["pages"])) {
                            echo "<td>No data</td>";
                        } else {
                            echo "<td>$book[pages]</td>";
                        }
                        echo <<< INFO
  </tr>
  <tr>
    <td class="first-column">Category:</td>
INFO;
                        if (empty($book["category"])) {
                            echo "<td>No data</td>";
                        } else {
                            echo "<td>$book[category]</td>";
                        }
                        echo <<< INFO
</table>
INFO;
                        ?>

                        <hr>

                        <div class="mt-4">
                            <?php
                            echo <<< CART
                            <form class=chatForm_1 action=../../scripts/cart_check.php method=post>
                                <button type="submit" name="isbn" value=$book[isbn] class="btn btn-primary btn-lg btn-flat"><i class="fas fa-cart-plus fa-lg mr-2"></i>Add to cart</button>
                            </form>
CART;

                            ?>
                        </div>

                    </div>
                </div>
                <div class="row mt-4">
                    <nav class="w-100">
                        <div class="nav nav-tabs" id="product-tab" role="tablist">
                            <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab"
                               href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                        </div>
                    </nav>
                    <div class="tab-content p-3" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="product-desc" role="tabpanel"
                             aria-labelledby="product-desc-tab">
                            <?php
                            if (empty($book["description"])) {
                                echo "No data";
                            } else {
                                echo "$book[description]";
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</div>

