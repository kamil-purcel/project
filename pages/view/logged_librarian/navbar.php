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
                <i class="fa fa-bell"></i>
                <span class="badge badge-warning navbar-badge">
                    <?php
                    require_once "../../scripts/connect.php";

                    $stmt = $conn->prepare("SELECT * FROM rental WHERE seen = 0");
                    $stmt->execute();
                    $result = $stmt->get_result();
                    if ($result->num_rows != 0) {
                        $orderCount = $result->num_rows;
                        echo $orderCount;
                    }else {
                        echo "0";
                    }
                    ?>
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <?php
                if ($result->num_rows != 0) {
                    while($order = $result->fetch_assoc()){
                        echo <<< CART
<div class="container">
  <div class="column column-left">
                    <div class="dropdown-divider"></div>
                    <p class=dropdown-item-text>Order - $order[id]</p>
  </div>

</div>

CART;
                    }
                    echo <<< CART
                    <div class="dropdown-divider"></div>
                <a href="./logs.php" class="dropdown-item dropdown-footer">Go to rental history</a>
CART;
                }
                ?>

            </div>
        </li>
    </ul>
</nav>