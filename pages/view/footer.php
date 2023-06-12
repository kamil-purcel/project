<?php
if (!isset($_SESSION["logged"]) || session_status() != 2) {
    $_SESSION["error"] = "Please login!";
    header("location: ../");
}
?>

<footer class="main-footer">
    <strong>Copyright &copy; 2023
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 1.0.0
        </div>
</footer>