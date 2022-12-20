const { ethers, getNamedAccounts } = require("hardhat")
const { expect, assert } = require("chai")

describe("ProxyContract", async () => {
    let deployerAdress
    let RPS
    let ProxyContract
    beforeEach(async () => {
        deployerAdress = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
        const factory = await ethers.getContractFactory("RPS")
        RPS = await factory.deploy()
        const ProxyFactory = await ethers.getContractFactory("ProxyContract")
        ProxyContract = await ProxyFactory.deploy()
    })

    it("Delegate call executed", async () => {
        await ProxyContract.proxyJoin(RPS.address)
        const firstPlayer = await ProxyContract.firstPlayer()
        assert.equal(firstPlayer, deployerAdress)
    })
})