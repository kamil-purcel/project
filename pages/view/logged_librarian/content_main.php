<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Librarian - Book list</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Book list</li>
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
                                    <th>ISBN</th>
                                    <th>Title</th>
                                    <th>Authors</th>
                                    <th>Publisher</th>
                                    <th>Published date</th>
                                    <th>Category</th>
                                    <th>Pages</th>
                                    <th>Edit / Delete</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                require_once "../../scripts/connect.php";
                                $stmt = $conn->prepare("SELECT * FROM books");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($book = $result->fetch_assoc()) {
                                    echo <<< USER
                      <tr>
                        <td>$book[isbn]</td>
                        <td>$book[title]</td>
                        <td>$book[authors]</td>
                        <td>$book[publisher]</td>
                        <td>$book[published_date]</td>
                        <td>$book[category]</td>
                        <td>$book[pages]</td>
                        <td>
                        <form class=chatForm action=./logged_librarian/update_book_tmp.php method=post>
                        <button type=submit name=editBookIsbn value=$book[isbn]>Edit</button>
                        </form><form class=declineForm action=../../scripts/delete_book.php method=post>
                        <button type=submit name=deletedBookIsbn value=$book[isbn]>Delete</button>
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