<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Admin - Users list</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Users list</li>
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
                                    <th>Email</th>
                                    <th>First name</th>
                                    <th>Last name</th>
                                    <th>Birthday</th>
                                    <th>Created at</th>
                                    <th>Permission</th>
                                    <th>Image</th>
                                    <th>Edit / Delete</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                require_once "../../scripts/connect.php";
                                $stmt = $conn->prepare("SELECT u.id, u.email, u.firstName, u.lastName, u.birthday, u.createdAt, u.image, p.permission FROM users u INNER JOIN permissions p on u.permissionId = p.id");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($user = $result->fetch_assoc()) {
                                    echo <<< USER
                      <tr>
                        <td>$user[email]</td>
                        <td>$user[firstName]</td>
                        <td>$user[lastName]</td>
                        <td>$user[birthday]</td>
                        <td>$user[createdAt]</td>
                        <td>$user[permission]</td>
                        <td>$user[image]</td>
                        <td>
                        <form class=chatForm action=./logged_admin/update_user_tmp.php method=post>
                        <button type=submit name=editUserId value=$user[id] class="btn btn-secondary btn-sm">Edit</button>
                        </form> &nbsp; <form class=declineForm action=../../scripts/delete_user.php method=post>
                        <button type=submit name=deletedUserId value=$user[id] class="btn btn-secondary btn-sm">Delete</button>
                        </form>
                        </td>
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