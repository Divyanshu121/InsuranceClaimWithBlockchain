var MyContract = artifacts.require("UserRegistration");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(MyContract);
};