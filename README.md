# DailyPlanner Smart Contract

This Solidity program is a simple DailyPlanner contract that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a basic DailyPlanner contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes functionalities such as addTask, getTask , updateTask and updateTaskStatus. This program serves as a simple and straightforward introduction to Solidity programming and can be used as a stepping stone for more complex projects in the future.

In this smart contract we also implements the require(), assert() and revert() statements.

- require(): Used for input validation and precondition checks, ensuring certain conditions are met before proceeding.
- revert(): Handles exceptions by reverting transactions, undoing state changes, and providing error messages.
- assert(): Used for internal error checking, catching programming errors and ensuring invariants hold true.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix IDE](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `DailyPlanner.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyPlanner {
    
    struct Task {
        string task; //task desc
        uint deadline;
        bool isCompleted;
        bool deadlineUpdated; //ddmmyyyy
    }

    mapping(address => Task[]) private userTasks;

    function addTask(string memory _task, uint _deadline) public {
        if (bytes(_task).length == 0) {
            revert("task description cannot be empty");
        }
        userTasks[msg.sender].push(Task({
            task: _task,
            deadline: _deadline,
            isCompleted: false,
            deadlineUpdated: false
        }));
    }

    function updateTaskStatus(uint _taskIndex, bool _isCompleted) public {
        assert(_taskIndex < userTasks[msg.sender].length);

        userTasks[msg.sender][_taskIndex].isCompleted = _isCompleted;
    }

    function updateTaskDeadline(uint _taskIndex, uint _newDeadline) public {
        require(_taskIndex < userTasks[msg.sender].length, "Task index out of bounds");
        require(!userTasks[msg.sender][_taskIndex].deadlineUpdated, "Deadline already updated once");

        userTasks[msg.sender][_taskIndex].deadline = _newDeadline;
        userTasks[msg.sender][_taskIndex].deadlineUpdated = true;
    }

    function getTasks() public view returns (Task[] memory) {
        return userTasks[msg.sender];
    }
}



```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile DailyPlanner.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DailyPlanner" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the createProposal and vote functions. For example, you can create a new proposal by providing a description. Similarly, you can poll on a proposal by providing the proposal ID.

## Authors

Ayush sah
[@linkedin](https://www.linkedin.com/in/ayushsah404/)


## License

This project is licensed under the MIT License
