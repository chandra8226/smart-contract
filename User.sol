// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.6;

contract MyContract {
    string name = "Jack";
    uint age = 15;

    
    function setInstructor(string memory _name, uint _age) public {
        require(keccak256(bytes(_name))!=keccak256(bytes("")));
        require(_age>5);
        name = _name;
        age = _age;
    }
    
    function getInstructor() public view returns (string memory, uint) {
        return (name, age);
    }
}
