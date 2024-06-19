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
