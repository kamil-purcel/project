<?php
session_start();
$_SESSION["editUserId"] = $_POST["editUserId"];

header("location: ./update_user.php");