// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ProxyContract {
    address public firstPlayer;
    address public secondPlayer;
    address public judge;

    function proxyJoin(address _contract) public {
        (bool success, ) = _contract.delegatecall(
            abi.encodeWithSignature("join()")
        );
        require(success, "Error");
    }
    
}