// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistration {
    
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
    
    struct Policy {
        uint256 policyId;
        address userAddress;
        uint256 amount;
        string policyType;
        bool isActive;
    }
    
    mapping(uint256 => Policy) public policies;
    
    uint256 public lastPolicyId;
    
    event PolicyCreated(uint256 policyId, address userAddress);
    
    function createPolicy(uint256 _amount, string memory _policyType) public returns(uint256) {
        require(_amount > 0, "Policy amount should be greater than 0");
        
        lastPolicyId++;
        policies[lastPolicyId] = Policy(lastPolicyId, msg.sender, _amount, _policyType, true);
        
        emit PolicyCreated(lastPolicyId, msg.sender);
        
        return lastPolicyId;
    }
    
    struct Claim {
        uint256 claimId;
        uint256 policyId;
        address userAddress;
        string claimReason;
        uint256 claimAmount;
        bool isVerified;
        bool isProcessed;
    }
    
    mapping(uint256 => Claim) public claims;
    
    uint256 public lastClaimId;
    
    event ClaimInitiated(uint256 claimId, address userAddress);
    
    function initiateClaim(uint256 _policyId, string memory _claimReason, uint256 _claimAmount) public returns(uint256) {
        require(_claimAmount > 0, "Claim amount should be greater than 0");
        
        lastClaimId++;
        claims[lastClaimId] = Claim(lastClaimId, _policyId, msg.sender, _claimReason, _claimAmount, false, false);
        
        emit ClaimInitiated(lastClaimId, msg.sender);
        
        return lastClaimId;
    }
    
    function verifyClaim(uint256 _claimId) public {
        Claim storage claim = claims[_claimId];
        require(msg.sender == policies[claim.policyId].userAddress, "Only insurer can verify the claim");
        require(claim.isVerified == false, "Claim already verified");

        claim.isVerified = true;
    }
}




