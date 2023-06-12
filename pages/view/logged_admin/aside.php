<?php
if (!isset($_SESSION["logged"]) || session_status() != 2) {
    $_SESSION["error"] = "Please login!";
    header("location: ../../");
}
?>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="./logged.php" class="brand-link">
        <img src="../../dist/img/logo/logo.png" alt="Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">Library</span>
    </a>

    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <?php
                echo '<img src="../../dist/img/users/' . $_SESSION["logged"]["image"] . '" class="img-circle elevation-2" alt="User Image">';
                ?>
            </div>
            <div class="info">
                <a href="./logged.php"
                   class="d-block"><?php echo $_SESSION["logged"]["firstName"] . " " . $_SESSION["logged"]["lastName"] ?></a>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="./logged.php" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Users</p>
                        <i class="right fas fa-angle-left"></i>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="./logged_admin/add_user.php" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add user</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Logs</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>