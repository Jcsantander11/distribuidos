// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract TasksContract {

    uint public tasksCounter = 0;

    constructor (){
        createTask("my first task", "my first description");
    }

    event TaskCreated(
        uint id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskToggleDone(uint id, bool done);

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }

    mapping(uint256 => Task) public tasks;

    function createTask(string memory _title, string memory _description)
        public
    {
        tasksCounter++;
        tasks[tasksCounter] = Task(tasksCounter, _title, _description, false, block.timestamp);
        emit TaskCreated(tasksCounter, _title, _description, false, block.timestamp);

    }

    function toggleDone(uint _id) public{
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggleDone(_id, _task.done);
    }

}