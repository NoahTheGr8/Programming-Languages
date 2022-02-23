
<!--
TODO:
    - Add more than 1 item to list
    - Allow to update alias
    - Interesting feature



-->
<html lang="en">
    <head>
        <title>PHP Test</title>
    </head>
    <body style="background-color:grey;">
            <h1>PLU System</h1>
            <h3>Enter a product and it's PLU to be stored in the system</h3>

            <form method='POST' action='main.php'>
                Product Name: <input type='text' name='name' /><br><br>

                Product Alias: <input type='text' name='alias' /><br><br>

                Product PLU: <input type='text' name='plu' /><br><br>

                Product Icon: <input type='file' name='picon' /><br><br>

                Password: <input type='text' name='pw' /><br><br>
                <input type='submit' name='submit' value='Submit' />
            </form>
            <!-- Show the list below where each product is an object -->
            <?php
            include("product.php");

            //writes the object to a file by appending it
            function writeObject($obj) {
                $objData = serialize($obj);
                $filePath = getcwd().DIRECTORY_SEPARATOR."inventory.txt";
                $fp = fopen($filePath, "a");
                fwrite($fp, $objData . "\n");
                fclose($fp);
            }

            //writes the object to a file by appending it
            function readObjects() {

                $filePath = getcwd().DIRECTORY_SEPARATOR."inventory.txt";
                $objData = file_get_contents($filePath);
                $all_objs = explode("\n", $objData);

                $inventory = array();
                for($i = 0; $i < count($all_objs) - 1; $i++) {
                    //convert object in string format to object format and push it into the inventory array show all for listing
                    array_push($inventory, unserialize($all_objs[$i]));
                }


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


            // Submit user input data for the inventory
            if ( isset($_POST['submit']) && $_POST['pw'] == 'pw') {

                //check if its in text file already


                $name = $_POST['name'];
                $alias = $_POST['alias'];
                $plu = $_POST['plu'];
                $picon = $_POST['picon']; // THE SELECTED IMAGE HAS TO BE WITHIN SAME DIRECTORY AS THIS PROJECT

                writeObject(new product($name, $alias, $plu,$picon));
                readObjects();

            }




            ?>
    </body
</html>

