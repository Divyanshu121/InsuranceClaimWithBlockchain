// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ClaimInitiation.sol";
import "./PolicyContract.sol";

contract ClaimVerification {

    ClaimInitiation public claimContract;
    PolicyContract public policyContract;

    // constructor(address _claimContractAddress) {
    //     claimContract = ClaimInitiation(_claimContractAddress);
    //     policyContract = claimContract.PolicyContract();
    // }

    // function verifyClaim(uint256 _claimId) public {
    //     ClaimInitiation.Claim storage claim = claimContract.claims(_claimId);
    //     require(msg.sender == policyContract.policies(claim.policyId).insurerAddress, "Only insurer can verify the claim");
    //     require(claim.isVerified == false, "Claim already verified");

    //     claim.isVerified = true;
    // }
}