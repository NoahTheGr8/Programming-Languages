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
            <!-- Show the list below where each product is an object -->
            <?php
            include("product.php");
            $inventory = array();

            // Submit user input data for 2D array
            if ( isset($_POST['submit']) && $_POST['pw'] == 'pw') {

                $name = $_POST['name'];
                $alias = $_POST['alias'];
                $plu = $_POST['plu'];
                $picon = $_POST['picon']; // THE SELECTED IMAGE HAS TO BE WITHIN SAME DIRECTORY AS THIS PROJECT

                //echo gettype($picon) . "$picon <br>";

                array_push($inventory, new product($name, $alias, $plu,$picon));

                //print_r($inventory);
                //Display all the inventory in a table fashion
                echo"<br>";
                echo "<table border='2'>
              <thead>
                <tr>
                <th>Name</th>
                <th style = 'background-color: #009933'>Alias</th>
                <th>PLU</th>
                <th>Picture</th>
                </tr>
              </thead>
              ";
                foreach ($inventory as $item) {
                    echo '<tr>';
                    echo '<td>' . $item->name . '</td>';
                    echo '<td style = "background-color: #009933">' . $item->alias . '</td>';
                    echo '<td>' . $item->plu . '</td>';
                    echo '<td><img alt="product image" height=100 width=100 src=".\/'. $item->picon.'"></td>';
                    echo '</tr>';
                }
            }
            else{
                echo "** password was wrong, please try again **";
            }

            ?>
    </body
</html>

