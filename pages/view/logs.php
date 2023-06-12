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
    <title>Library - Dashboard</title>
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

    <link rel="stylesheet" href="../../dist/css/myFrom.css">


</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">
    <?php
    require_once "./$permissionId/navbar.php";
    require_once "./$permissionId/aside.php";

    require_once "./$permissionId/content_logs.php";

    require_once "./footer.php";
    ?>
</div>
<script src="../../plugins/jquery/jquery.min.js"></script>
<script src="../../dist/js/adminlte.js"></script>

<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
</body>
</html>
