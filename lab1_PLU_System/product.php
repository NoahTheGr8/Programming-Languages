<?php

class product
{

    public $name;
    public $plu;
    public $directory;

    /**
     * @param $name
     */
    public function __construct($name, $plu, $directory)
    {
        $this->name = $name;
        $this->plu = $plu;
        $this->directory = $directory;
    }

    /**
     * returns the name of the product
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * returns the plu of the product
     */
    public function getPlu()
    {
        return $this->plu;
    }

    /**
     * returns the directory of the selected icon
     */
    public function getDirectory()
    {
        return $this->directory;
    }


}