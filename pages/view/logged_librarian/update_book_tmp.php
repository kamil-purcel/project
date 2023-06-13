<?php
session_start();
$_SESSION["editBookIsbn"] = $_POST["editBookIsbn"];

header("location: ./update_book.php");