<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Cart</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <?php

        require_once "../../scripts/connect.php";
        try {
            if (isset($_SESSION['cart'])) {
                foreach ($_SESSION['cart'] as $bookInfo) {
                    $stmt = $conn->prepare("SELECT * FROM books WHERE isbn=?");
                    $stmt->bind_param("s", $bookInfo["isbn"]);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    $book = $result->fetch_assoc();

                    if ($result->num_rows == 0) {
                        $_SESSION["error"] = "Book not found!";
                        echo "<script>history.back();</script>";
                        exit();
                    }

                    echo <<< INFO
        <div class="card card-solid">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 col-sm-1">
                        <div class="col-12">
                            <img src="../../dist/img/covers/$book[image]" class="product-image" alt="Book cover">
                        </div>
                    </div>
                    <div class="col-12 col-sm-10">
                    <h4 class=my-3> $book[title] </h4>
<table>
  <tr>
    <td>Authors: &emsp;</td>
<td>$book[authors]</td>
                        
</table>
INFO;
        ?>
</div>
<div class="col-12 col-sm-1">

    <?php
    echo <<< CART
                            <form class=chatForm_1 action=../../scripts/cart_delete.php method=post>
                                <button type="submit" name="isbn" value=$book[isbn] class="btn btn-danger btn-lg font-my">X</button>
                            </form>

                    </div>

</div>
</div>
</div>
CART;
                }
            }else{
        echo '<script>window.location.href = "./logged.php";</script>';
        exit();
    }
        } catch (mysqli_sql_exception $error) {
            $_SESSION["error"] = $error->getMessage();
            echo "<script>history.back();</script>";
            exit();
        }
        ?>




            <div class="row">
    <div class="col-12 col-sm-6">
        <?php
        echo <<< CART
                            <form class=chatForm_1 action=../../scripts/cart_delete_all.php method=post>
                                <button type="submit" class="btn btn-danger btn-block btn-lg">Cancel</button>
                            </form>
CART;

        ?>
    </div>
    <div class="col-12 col-sm-6">
        <?php
        echo <<< CART
                            <form class=chatForm_1 action=../../scripts/cart_order.php method=post>
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Order</button>
                            </form>
CART;

        ?>
    </div>
    </div>

    </section>
</div>

