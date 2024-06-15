# InventoryManagement Smart Contract

This Solidity program is a simple Inverntory management contract that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a basic Inverntory management contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes functionalities such as addItem , updateItem , deleteItem and getInventory. This program serves as a simple and straightforward introduction to Solidity programming and can be used as a stepping stone for more complex projects in the future.

In this smart contract we also implements the require(), assert() and revert() statements.

- require(): Used for input validation and precondition checks, ensuring certain conditions are met before proceeding.
- revert(): Handles exceptions by reverting transactions, undoing state changes, and providing error messages.
- assert(): Used for internal error checking, catching programming errors and ensuring invariants hold true.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix IDE](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `InventoryManagement.sol`). Copy and paste the following code into the file:

```solidity
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile InventoryManagement.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "InventoryManagement" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the createProposal and vote functions. For example, you can create a new proposal by providing a description. Similarly, you can poll on a proposal by providing the proposal ID.

## Authors

Ayush sah
[@linkedin](https://www.linkedin.com/in/ayushsah404/)


## License

This project is licensed under the MIT License
