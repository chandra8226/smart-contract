// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Login {

    struct User{
        string name;
        address _useraddress;
        bytes32 accessKey; // user master key Hash
    }
    
    uint usercount = 0;
    address[] _glbluseraddress;
    
    mapping(address => User) registerUsers;
    mapping(address => uint) isRegistered;
    
    event registeredUserEvent(address indexed _useraddress);
    
    function registerUser(string memory _name, bytes32 accessKey) public payable returns(bool) {
        User memory newuser = User(_name, msg.sender, accessKey);
        registerUsers[msg.sender] = newuser;
        isRegistered[msg.sender] = 1;
        emit registeredUserEvent(msg.sender);
        _glbluseraddress.push(msg.sender);
        usercount++;
        return true;
    }
    
    
    function getAccessKey(address _uaddr_)public view returns(bytes32){
        return registerUsers[_uaddr_].accessKey;
    }
    
    function getName(address _uaddr_)public view returns(string memory){
        return registerUsers[_uaddr_].name;
    }
    
    function isUserRegistered(address _uaddr_) public view returns(bool) {
        if(isRegistered[_uaddr_]==0){
            return false;
        }
        return true;
    }
    
}
