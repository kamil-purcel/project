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
    <title>Library - Update user</title>
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
            <h1><b>Edit user</b></h1>
        </div>
        <div class="card-body">

            <?php

            require_once "../../../scripts/connect.php";

            try {
                $stmt = $conn->prepare("SELECT * FROM users WHERE id=?");
                $stmt->bind_param("s", $_SESSION["editUserId"]);
                $stmt->execute();
                $result = $stmt->get_result();
                $user = $result->fetch_assoc();

                if ($result->num_rows != 0) {
                    echo <<< UPDATEUSERFORM
            <form action="../../../scripts/update_user.php" method="post">
            <input type="hidden" name="userId" value="$user[id]">
First name
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="First name" name="firstName" value="$user[firstName]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
Last name
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Last name" name="lastName" value="$user[lastName]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
Email
                <div class="input-group mb-3">
                    <input type="email" class="form-control" placeholder="Email" name="email" value="$user[email]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
Password
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
Permission
        <div class="input-group mb-3">
          <select class="custom-select" name="permissionId">
UPDATEUSERFORM;
                    $sql = "SELECT * FROM permissions";
                    $result = $conn->query($sql);
                    while ($prem = $result->fetch_assoc()) {
                        if ($prem["id"] == $user["permissionId"]) {
                            echo "<option selected value='$prem[id]'>$prem[permission]</option>";
                        } else {
                            echo "<option value='$prem[id]'>$prem[permission]</option>";
                        }
                    }
                    echo <<< UPDATEUSERFORM
          </select>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-unlock"></span>
            </div>
          </div>
        </div>

Image
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Image" name="image" value="$user[image]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-icons"></span>
                        </div>
                    </div>
                </div>
Birthday
                <div class="input-group mb-3">
                    <input type="date" class="form-control" name="birthday" value="$user[birthday]">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-calendar"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">Update</button>
                    </div>
                </div>
            </form>
UPDATEUSERFORM;
                }
            } catch (mysqli_sql_exception $error) {
                $_SESSION["error"] = $error->getMessage();
                echo "<script>history.go(-2);</script>";
                exit();
            }
            ?>
            <a href="../logged.php" class="text-center">Discard changes</a>

        </div>
    </div>
</div>
</body>
</html>