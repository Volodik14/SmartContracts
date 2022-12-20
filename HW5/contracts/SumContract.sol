// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AnimeSumTwoValuesContract {
    int a;
    int b;
    int c;

    function add(int value1, int value2) public {
        a = value1;
        b = value2;
        c = a + b;
    }

    function getSum() public view returns (int) {
        return c;
    }
}