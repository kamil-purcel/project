<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>User - Books</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="./logged.php">Home</a></li>
                        <li class="breadcrumb-item active">Books</li>
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
                    <div class="card">
                        <div class="card-body p-0">
                            <ul class="users-list-my clearfix">
                                <?php
                                require_once "../../scripts/connect.php";

                                $stmt = $conn->prepare("SELECT * FROM books;");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while($item = $result->fetch_assoc()){
                                    echo <<< BOOKS
                                        <li>
                                        <img src=../../dist/img/covers/$item[image] alt=Book Image>
                                        <br>
                                        <a class=users-list-name-my href="#" onclick=sendValue('$item[isbn]')><h6>$item[title]</h6></a>
                                        <form id=myFormToSent action=./logged_user/e-commerce_tmp.php method=POST>
                                         <input type=hidden id=hiddenInput name=isbn value=>
                                           </form>
                                        <span class=users-list-date-my>$item[authors]</span>
                                        <form class=chatForm_1 action=../../scripts/cart_check.php method=post>
                                        <button type="submit" name="isbn" value=$item[isbn] class="btn btn-primary btn-block">Add to cart</button>
                                        </form>
                                        </li>
BOOKS;
                                }
                                ?>
                                <script>
                                    function sendValue(isbn) {
                                        document.getElementById('hiddenInput').value = isbn;
                                        document.getElementById('myFormToSent').submit();
                                    }
                                </script>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>