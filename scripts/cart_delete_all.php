<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();

    if (isset($_SESSION['cart'])) {
        unset($_SESSION['cart']);
    }

    echo "<script>history.back();</script>";
    exit();

}


