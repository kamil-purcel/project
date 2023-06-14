<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();

    if (isset($_SESSION['cart'])) {
        foreach ($_SESSION['cart'] as $key => $product) {
            if ($product['isbn'] == $_POST["isbn"]) {
                unset($_SESSION['cart'][$key]);
                break;
            }
        }
        if(count($_SESSION['cart'])==0){
            unset($_SESSION['cart']);
        }
    }

    echo "<script>history.back();</script>";
    exit();

}


