<?php

class inventory
{

    public array $inventory = array();

    /**
     * creates the array object that will hold all the items
     */
    public function __construct(array $inventory)
    {
        $this->inventory = $inventory;
    }

    /**
     * returns the inventory array
     */
    public function getInventory(): array
    {
        return $this->inventory;
    }



}