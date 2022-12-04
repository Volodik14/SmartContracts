const Web3 = require('web3')
var web3 = new Web3("https://mainnet.infura.io/v3/1fbfe6f0fae94281be2a3127259ea517");
const address = "0xCf0054c729f41cA5b3508c2B243260664aFb20a9";

const ABI = [
      {
        "inputs": [
          {
            "internalType": "int256",
            "name": "value1",
            "type": "int256"
          },
          {
            "internalType": "int256",
            "name": "value2",
            "type": "int256"
          }
        ],
        "name": "add",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "getSum",
        "outputs": [
          {
            "internalType": "int256",
            "name": "",
            "type": "int256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ];

web3.eth.getBalance ;

const myContract = new web3.eth.Contract(ABI, address);
myContract.methods.getSum().call().then(console.log);