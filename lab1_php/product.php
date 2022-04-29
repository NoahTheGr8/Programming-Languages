<?php

class product
{

    public $name = NULL;
    public $alias = NULL;
    public $plu = NULL;
    public $picon = NULL;

    function __construct($name, $alias, $plu, $picon)
    {
        $this->name = $name;
        $this->alias = $alias;
        $this->plu = $plu;
        $this->picon = $picon;
    }
}
?>
