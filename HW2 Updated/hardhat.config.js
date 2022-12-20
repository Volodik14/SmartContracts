require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-waffle");

require("dotenv").config()

/** Temporally deleted */
GOERLI_PRIVATE_KEY = ""
GOERLI_ENDPOINT = ""

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
	  goerli: {
		  url: GOERLI_ENDPOINT,
		  accounts: [`0x${GOERLI_PRIVATE_KEY}`]
	  }
  }
};
