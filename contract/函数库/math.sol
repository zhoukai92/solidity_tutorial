// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

library Math {

    function add(uint256 a, uint256 b) external  pure returns (uint256) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    
    function minus(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
}