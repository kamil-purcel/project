<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Librarian - Rental history</h1>
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
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>ISBN</th>
                                    <th>Title</th>
                                    <th>Rental date</th>
                                    <th>Return date</th>
                                    <th>Accept</th>
                                    <th>Accept / Reject</th>
                                    <th>Return</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                require_once "../../scripts/connect.php";
                                $stmt = $conn->prepare("SELECT r.id, u.firstName, u.lastName, b.isbn, b.title, ri.rentalDate, ri.returnDate, ri.accept FROM rental r INNER JOIN rental_info ri on r.id = ri.id INNER JOIN books b on ri.isbn = b.isbn INNER JOIN users u on r.userId = u.id ");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($log = $result->fetch_assoc()) {
                                    echo <<< USER
                      <tr>
                      
                        <td>$log[id]</td>
                        <td>$log[firstName] $log[lastName]</td>
                        <td>$log[isbn]</td>
                        <td>$log[title]</td>
                        <td>$log[rentalDate]</td>
                        <td>$log[returnDate]</td>
USER;
                              if(is_null($log["accept"])){
                                  echo <<< USER
<td></td>
                        <td>
                        <form class=chatForm action=../../../scripts/accept_order.php method=post>
                        <input type=hidden id=hiddenInput name=rentalISBN value=$log[isbn]>
                        
                        <button type=submit name=rentalID value=$log[id] class="btn btn-secondary btn-sm">Accept</button>
                        </form> &ensp; <form class=declineForm action=../../../scripts/reject_order.php method=post>
                        <input type=hidden id=hiddenInput name=rentalISBN value=$log[isbn]>
                        
                        <button type=submit name=rentalID value=$log[id] class="btn btn-secondary btn-sm">Reject</button>
                        </form>
                        </td>
                        <td>
</td>
USER;
                              }else if($log["accept"] == 1){
                                  echo <<< USER
<td>Accepted</td>
                        <td></td>
USER;
                                  if(is_null($log["returnDate"])) {
                                      echo <<< USER
<td>
                        <form class=chatForm action=../../../scripts/return_book.php method=post>
                        <input type=hidden id=hiddenInput name=rentalISBN value=$log[isbn]>
                        <button type=submit name=rentalID value=$log[id] class="btn btn-secondary btn-sm">Return</button>
                        </form>
</td>
USER;
                                  }
                              else{
                                  echo "<td></td>";
                              }
                              }else{
                                  echo <<< USER
<td>Rejected</td>
                        <td></td>
                        <td></td>
USER;
                              }
                                    echo "</tr>";
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