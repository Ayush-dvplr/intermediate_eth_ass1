// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InventoryManagement {
    
    struct Item {
        uint id;
        string name;
        uint qnt;
    }
    
    Item[] private inventory;
    uint private nextId;
    
    constructor() {
        inventory.push(Item(++nextId, "Apple", 10));
        inventory.push(Item(++nextId, "Banana", 20));
        inventory.push(Item(++nextId, "Orange", 30));
    }
    
    function getInventory() public view returns (Item[] memory) {
        return inventory;
    }
    
    function addItem(string memory name, uint qnt) public {
        if(bytes(name).length == 0){
            revert( "Name cannot be empty");
        }
        if(qnt==0){
            revert("Quantity can't be 0");
        }
        inventory.push(Item(++nextId, name, qnt));
    }

    function updateItem(uint id, uint qnt) public {
        uint flag = 0;
        for (uint i = 0; i < inventory.length; i++) {
            if (inventory[i].id == id) {
                inventory[i].qnt = qnt;
                flag = 1;
                 break;
            }
        }
        require(flag==1,"No such item with given id !");
    }
    
    function deleteItem(uint id) public {
        uint flag = 0;
        for (uint i = 0; i < inventory.length; i++) {
            if (inventory[i].id == id) {
                flag = 1;
                inventory[i] = inventory[inventory.length - 1];
                inventory.pop();
                break ;
            }
        }
         assert(flag==1);
    }
}
