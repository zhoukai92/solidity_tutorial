// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

import "./math.sol";

contract TestMath {

    using Math for uint;

    function testAdd() public pure returns (uint256) {
        uint a = 1;
        uint res = a.add(2);
        return res;
    }
    function testMinus() public pure returns (uint256) {
        uint a = 10;
        uint res = a.minus(2);
        return res;
    }

}