<?php
session_start();

if (!isset($_SESSION['count']))
{
    $_SESSION['count'] = 1;
}
else
{
    echo session_id();
    echo '<br>';
    ++$_SESSION['count'];
}

echo $_SESSION['count'];
?>