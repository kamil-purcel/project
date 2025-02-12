<?php
session_start();
if (isset($_SESSION["logged"]) && session_status() == 2) {
    header("location: ./view/logged.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library - Login</title>
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
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

    if (isset($_SESSION["success"])) {
        echo <<< SUCCESS
        <div class="callout callout-success">
          <h5>Congratulations!</h5>
          <p>$_SESSION[success]</p>
        </div>
SUCCESS;
        unset($_SESSION["success"]);
    }
    ?>
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <a href="#" class="h1"><b>Library</b></a>
        </div>
        <div class="card-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <form action="../scripts/login.php" method="post">
                <div class="input-group mb-3">
                    <input type="email" class="form-control" placeholder="Email" name="email">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                        <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                </div>
            </form>
            <p class="mb-1">
                <a href="./forgot-password.php">I forgot my password</a>
            </p>
            <p class="mb-0">
                <a href="./register.php" class="text-center">Register a new membership</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
