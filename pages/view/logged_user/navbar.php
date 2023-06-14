<?php
if (!isset($_SESSION["logged"]) || session_status() != 2) {
    $_SESSION["error"] = "Please login!";
    header("location: ../");
}
?>

<nav class="main-header navbar navbar-expand navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="./logged.php" class="nav-link">Home</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="./contact-us.php" class="nav-link">Contact</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="../../scripts/logout.php" class="nav-link">Log out</a>
        </li>
    </ul>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fa fa-shopping-cart"></i>
                <span class="badge badge-warning navbar-badge">
                    <?php
                    if (isset($_SESSION['cart'])) {
                        $iloscProduktow = count($_SESSION['cart']);
                        echo $iloscProduktow;
                    } else {
                        echo "0";
                    }
                    ?>
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <?php

                if (isset($_SESSION['cart'])) {
                    foreach ($_SESSION['cart'] as $book) {
                        echo <<< CART
<div class="container">
  <div class="column column-left">
    <!-- Zawartość lewej kolumny -->
                    <div class="dropdown-divider"></div>
                    <a class=dropdown-item-text href="#" onclick=sendValue('$book[isbn]')>$book[title]</a>
                    <form id=myFormToSent action=./logged_user/e-commerce_tmp.php method=POST>
                                         <input type=hidden id=hiddenInput name=isbn value=>
                                           </form>
  </div>
  <div class="column column-right">
                   <form class=chatForm_1 action=../../scripts/cart_delete.php method=post>
                                        <button type="submit" name="isbn" value=$book[isbn] class="btn btn-sm btn-danger">X</button>
                                        </form>
                  
    <!-- Zawartość prawej kolumny -->
  </div>
</div>

CART;
                    }
                    echo <<< CART
                    <div class="dropdown-divider"></div>
                <a href="./cart.php" class="dropdown-item dropdown-footer">Go to cart</a>
CART;
                }
                ?>


                <script>
                    function sendValue(isbn) {
                        document.getElementById('hiddenInput').value = isbn;
                        document.getElementById('myFormToSent').submit();
                    }
                </script>
            </div>
        </li>
    </ul>
</nav>