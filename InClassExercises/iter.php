<html lang="en">
    <head>
        <title>PHP Test</title>
    </head>
    <body>

    <h1>Iteration Program</h1>
    Today's Date:

    <?php echo date("l F d, Y"); ?>

    <h3>Enter a value to to iterate</h3>

    <form action="results.php" method="post">
        <input type="text" name="data">
        <br/>
        <input type="submit" value="Show Results">
    </form>

    </body>
</html>