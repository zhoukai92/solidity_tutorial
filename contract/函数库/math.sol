// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

library Math {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
    
    function minus(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
}