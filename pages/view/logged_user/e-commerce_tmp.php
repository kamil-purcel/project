<?php
session_start();
$_SESSION["isbn"] = $_POST["isbn"];

header("location: ../e-commerce.php");