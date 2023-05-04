
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));

const abi = [];
const bytecode = "0x594F719F80cbfB175A103EeF5cF9A54c364FB762";

// Create an instance of the contract using the ABI and bytecode
const contract = new web3.eth.Contract(abi);

// Get the user's account address
web3.eth.getAccounts()
  .then(accounts => {
    const account = accounts[0];
    contract.options.address = "0x594F719F80cbfB175A103EeF5cF9A54c364FB762";
    contract.options.from = account;
console.log("out");
    // Call the registerUser function of the UserRegistration contract
    function register(){
      console.log("ajkn");
      var name = document.forms["myForm"]["name"].value;
      console.log(name);
    }

    contract.methods.registerUser("Alice", "alice@example.com", "password")
      .send()
      .then(receipt => {
        console.log("User registered:", receipt);
      })
      .catch(error => {
        console.error("Failed to register user:", error);
      });

    // Call the createPolicy function of the PolicyContract contract
    contract.methods.createPolicy(1000, "Car insurance")
      .send()
      .then(receipt => {
        console.log("Policy created:", receipt);
      })
      .catch(error => {
        console.error("Failed to create policy:", error);
      });

    // Call the initiateClaim function of the ClaimInitiation contract
    contract.methods.initiateClaim(1, "Accident", 500)
      .send()
      .then(receipt => {
        console.log("Claim initiated:", receipt);
      })
      .catch(error => {
        console.error("Failed to initiate claim:", error);
      });

    // Call the setPolicyContract function of the ClaimInitiation contract
    contract.methods.setPolicyContract(1, /* address of the insurer */)
      .send()
      .then(receipt => {
        console.log("Policy contract set:", receipt);
      })
      .catch(error => {
        console.error("Failed to set policy contract:", error);
      });

    // Call the verifyClaim function of the ClaimVerification contract
    contract.methods.verifyClaim(1)
      .send()
      .then(receipt => {
        console.log("Claim verified:", receipt);
      })
      .catch(error => {
        console.error("Failed to verify claim:", error);
      });
  })
  .catch(error => {
    console.error("Failed to get accounts:", error);
  });
