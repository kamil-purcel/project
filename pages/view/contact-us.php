<?php
session_start();

if (!isset($_SESSION["logged"]) || session_status() != 2) {
    $_SESSION["error"] = "Please login!";
    header("location: ../");
} else {
    switch ($_SESSION["logged"]["permissionId"]) {
        case 1:
            $permissionId = "logged_user";
            break;
        case 2:
            $permissionId = "logged_librarian";
            break;
        case 3:
            $permissionId = "logged_admin";
            break;
    }
    if (isset($_SESSION["editUserId"])) {
        unset($_SESSION["editUserId"]);
    }
}

if (isset($_SESSION["logged"]["lastActivity"])) {
    $lastActivityTime = $_SESSION["logged"]["lastActivity"];
    $currentTime = time();
    $sessionTimeout = 30;

    if ($currentTime - $lastActivityTime > $sessionTimeout) {
        $_SESSION["error"] = "Session has expired!";
        unset($_SESSION["logged"]);
        header("location: ../");
        exit();
    }
    $_SESSION["logged"]["lastActivity"] = $currentTime;
} else {
    $_SESSION["error"] = "Session has expired or is not active!";
    header("location: ../");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library - Contact us</title>
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <?php
    require_once "./$permissionId/navbar.php";
    require_once "./$permissionId/aside.php";
    ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Contact us</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="logged.php">Home</a></li>
                            <li class="breadcrumb-item active">Contact us</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">

            <div class="card">
                <div class="card-body row">
                    <div class="col-4 text-center d-flex align-items-center justify-content-center">
                        <div class="">
                            <h2>Kamil Purcel</h2>
                            <p class="lead mb-5">Index: 129187</p>
                        </div>
                    </div>
                    <div class="col-4 text-center d-flex align-items-center justify-content-center">
                        <div class="">
                            <h2>Mateusz Podhalicz</h2>
                            <p class="lead mb-5">Index: 129144</p>
                        </div>
                    </div>
                    <div class="col-4 text-center d-flex align-items-center justify-content-center">
                        <div class="">
                            <h2>Jakub Plenzler</h2>
                            <p class="lead mb-5">Index: 86560</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <?php
    require_once "./footer.php";
    ?>
</div>
<script src="../../plugins/jquery/jquery.min.js"></script>
<script src="../../dist/js/adminlte.js"></script>
</body>
</html>
