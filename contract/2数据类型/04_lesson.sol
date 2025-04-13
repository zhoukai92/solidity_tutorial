// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

// 
contract AddressChecker {
    // 过 extcodesize 操作码判断一个地址是否为合约地址。
    function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        } // 获取地址的代码大小
        return size > 0; // 大于 0 说明是合约地址
    }
}
