// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolicyContract {
    
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
}