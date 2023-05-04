// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClaimInitiation {
    
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
}