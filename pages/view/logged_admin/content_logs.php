<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Admin - Logs</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Logs</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
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
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>UserID</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>IP Address</th>
                                    <th>Created at</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                require_once "../../scripts/connect.php";
                                $stmt = $conn->prepare("SELECT l.id, l.userId, l.email, l.IPAddress, l.createdAt, lt.type FROM logs l INNER JOIN logs_type lt on l.status = lt.id");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($log = $result->fetch_assoc()) {
                                    echo <<< USER
                      <tr>
                        <td>$log[id]</td>
                        <td>$log[userId]</td>
                        <td>$log[email]</td>
                        <td>$log[type]</td>
                        <td>$log[IPAddress]</td>
                        <td>$log[createdAt]</td>
                      </tr>
USER;
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>