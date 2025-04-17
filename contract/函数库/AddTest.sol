// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

import "./math.sol";

// 使用 SafeMath 库的合约
contract AddTest {
    function add(uint x, uint y) public pure returns (uint) {
        return Math.add(x, y);
    }

}