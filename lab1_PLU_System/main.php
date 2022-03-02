<!--

Author: R Noah Padilla and various online resources (commented their sources above them)

About this assignment: Its a php project that allows users, from a grocery store worker POV,
                        to view or enter items into a table or PLU. This is known as a PLU system.

Features:
    > Allows user to enter
        >> product: Name, Alias, PLU, icon
        >> password to ensure the person adding a product is a admin of the system
    > Sorts the inventory by name (associated with a number)
    > Colors Aliases green
    > Shakes image if cursor is hovering above them
-->

<html lang="en">
    <head>
        <title>PLU System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Cool extra feature that allows user to hover above inserted images and the shake
        https://www.w3schools.com/howto/howto_css_shake_image.asp
        :)-->
        <style>
            img:hover {
                animation: shake 0.5s;
                animation-iteration-count: infinite;
            }

            @keyframes shake {
                0% { transform: translate(1px, 1px) rotate(0deg); }
                10% { transform: translate(-1px, -2px) rotate(-1deg); }
                20% { transform: translate(-3px, 0px) rotate(1deg); }
                30% { transform: translate(3px, 2px) rotate(0deg); }
                40% { transform: translate(1px, -1px) rotate(1deg); }
                50% { transform: translate(-1px, 2px) rotate(-1deg); }
                60% { transform: translate(-3px, 1px) rotate(0deg); }
                70% { transform: translate(3px, 1px) rotate(-1deg); }
                80% { transform: translate(-1px, -1px) rotate(1deg); }
                90% { transform: translate(1px, 2px) rotate(0deg); }
                100% { transform: translate(1px, -2px) rotate(-1deg); }
            }
        </style>
    </head>
    <body style="background-color:grey;">
            <h1>PLU System</h1>
            <h3>Enter a product and it's PLU to be stored in the system</h3>

            <form method='POST' action='main.php'>
                Product Name: <input type='text' required="required" name='name' placeholder="4558"/><br><br>

                Product Alias: <input type='text' name='alias' placeholder="nopales"/><br><br>

                Product PLU: <input type='text' name='plu' required="required" placeholder="price look up"/><br><br>

                Product Icon: <input type='file' name='picon'/><br><br>

                Password: <input type='text' name='pw' required="required"  placeholder="pssst it's 'pw' "><br><br>
                <input type='submit' name='submit' value='Submit' />

            </form>

            <h3 style='color:blue;' >HOVER ABOVE IMAGES FOR EFFECT</h3>
            <!-- Show the list below where each product is an object -->
            <?php
            include("product.php");

            //used to sort in ascending order by NAME (is a number and not a word) - used this for help https://stackoverflow.com/questions/9001294/bubble-sort-implementation-in-php
            function sortObjects($a,$b){

                if(  $a->name ==  $b->name ){ return 0 ; }
                return ($a->name < $b->name) ? -1 : 1;
            }

            //checks if a product is already in the inventory
            function alreadyInList($name){

                $filePath = getcwd().DIRECTORY_SEPARATOR."inventory.txt";
                $objData = file_get_contents($filePath);
                $all_objs = explode("\n", $objData);

                $inventory = array();
                for($i = 0; $i < count($all_objs) - 1; $i++) {
                    //convert object in string format to object format and push it into the inventory array show all for listing
                    array_push($inventory, unserialize($all_objs[$i]));
                }

                foreach($inventory as $item){
                    if($item->name == $name){
                        return True;
                    }
                }
                return False;
            }

            //writes the object to a file by appending it - used this for help https://stackoverflow.com/questions/18681090/write-and-read-php-object-in-a-text-file
            function writeObject($obj) {
                $objData = serialize($obj);
                $filePath = getcwd().DIRECTORY_SEPARATOR."inventory.txt";
                $fp = fopen($filePath, "a");
                fwrite($fp, $objData . "\n");
                fclose($fp);
            }

            //reads the objects from the file by appending it - used this for help https://stackoverflow.com/questions/18681090/write-and-read-php-object-in-a-text-file
            function readObjects() {

                $filePath = getcwd().DIRECTORY_SEPARATOR."inventory.txt";
                $objData = file_get_contents($filePath);
                $all_objs = explode("\n", $objData);

                $inventory = array();
                for($i = 0; $i < count($all_objs) - 1; $i++) {
                    //convert object in string format to object format and push it into the inventory array show all for listing
                    array_push($inventory, unserialize($all_objs[$i]));
                }

                //sort the objects so they can be displayed in alphabetical order
                usort($inventory, "sortObjects");

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
                    //embed the icon into the table
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

                if(!alreadyInList($name)) {
                    writeObject(new product($name, $alias, $plu, $picon));
                }
                else{
                    echo "ERROR: This item is already in the inventory! Try another name to add it to inventory. ";
                }
            }
            else{
            }
            readObjects();

            ?>
    </body
</html>

