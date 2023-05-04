// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewUserReg {
    
    struct User {
        address userAddress;
        uint256 userId;
        string name;
        string email;
        string password;
    }
    
    mapping(address => User) public users;
    
    uint256 public lastUserId;
    
    event UserRegistered(uint256 userId, address userAddress);
    
    function registerUser(string memory _name, string memory _email, string memory _password) public {
        require(bytes(_name).length > 0 && bytes(_email).length > 0 && bytes(_password).length > 0, "All fields are required");
        require(users[msg.sender].userAddress == address(0), "User already exists");
        
        lastUserId++;
        users[msg.sender] = User(msg.sender, lastUserId, _name, _email, _password);
        
        emit UserRegistered(lastUserId, msg.sender);
    }
}