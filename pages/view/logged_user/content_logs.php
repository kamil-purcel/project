<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>User - Rental history</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Rental history</li>
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
                                    <th>Title</th>
                                    <th>Authors</th>
                                    <th>Accept</th>
                                    <th>Rental date</th>
                                    <th>Return date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                require_once "../../scripts/connect.php";
                                $stmt = $conn->prepare("SELECT b.title, b.authors, ri.rentalDate, ri.returnDate, ri.accept FROM rental r INNER JOIN rental_info ri on r.id = ri.id INNER JOIN books b on ri.isbn = b.isbn  WHERE r.userId = ?");
                                $stmt->bind_param("i", $_SESSION["logged"]["id"]);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($log = $result->fetch_assoc()) {
                                    echo <<< USER
                      <tr>
                        <td>$log[title]</td>
                        <td>$log[authors]</td>
USER;
                              if(is_null($log["accept"])){
                                  echo "<td></td>";
                              }else if($log["accept"] == 1){
                                  echo "<td>Accepted</td>";
                              }else{
                                  echo "<td>Rejected</td>";
                              }
                                    echo <<< USER
                        <td>$log[rentalDate]</td>
                        <td>$log[returnDate]</td>
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