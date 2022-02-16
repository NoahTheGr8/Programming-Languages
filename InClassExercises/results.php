<html>
    <head>
        <title>PHP Test</title>
    </head>
    <body>
    <h1>Here are 10 iterations of the formula</h1>
    y = x <sup>2</sup>
    <br/>

    <?php
        $num = $_POST['data'];

        for ($x = 1 ; $x <= 10 ; $x++){
            $num *= $num;
            echo "$x : $num" ;
            echo "<br>";
        }
    ?>
    </body>
</html>