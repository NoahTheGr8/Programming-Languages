<html lang="en">
    <head>
        <title>PHP Test</title>
    </head>
    <body>
            <h1>PLU System</h1>
            <h3>Enter a product and it's PLU to be stored in the system</h3>

            <form method='POST' action='main.php'>
                Product Name: <input type='text' name='name' /><br><br>

                Product Alias: <input type='text' name='alias' /><br><br>

                Product PLU: <input type='text' name='plu' /><br><br>

                Product Icon: <input type='file' name='picon' /><br><br>

                Password: <input type='text' name='pw' /><br><br>
                <input type='submit' name='submit' value='submit' />
            </form>
    </body
</html>

<!-- Show the list below where each product is an object -->
<?php
    include("product.php");
    $inventory = array();

    // Submit user input data for 2D array
    if ( isset($_POST['submit'])) {

        $name = $_POST['name'];
        $alias = $_POST['alias'];
        $plu = $_POST['plu'];
        $picon = $_POST['picon'];

        //echo gettype($picon) . "$picon <br>";

        array_push($inventory, new product($name, $alias, $plu,$picon));

        print_r($inventory);

        echo"<br>";
        echo "<table id='tsa' border='2' id='example' class='table table-striped responsive-utilities table-hover'>
              <thead>
                <tr>
                <th>Name</th>
                <th>Alias</th>
                <th>PLU</th>
                <th>Picture</th>
                </tr>
              </thead>
              ";
        foreach ($inventory as $item) {
            echo '<tr>';
            echo '<td>' . $item->name . '</td>';
            echo '<td>' . $item->alias . '</td>';
            echo '<td>' . $item->plu . '</td>';
            echo '<td><img alt="product image" height=100 width=100 src=".\/'. $item->picon.'"></td>';
            echo '</tr>';
        }

    }

    //Array ( [0] => product Object ( [name] => [plu] => [directory] => ) ) <<<<<<<WITHOUT []
    //Array ( [0] => Array ( ) [1] => product Object ( [name] => aaa [plu] => 1111 [directory] => ) ) <<<<<<<<WITH []

?>