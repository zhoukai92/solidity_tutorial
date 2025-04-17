// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

// 
contract AddressChecker {
    // 过 extcodesize 操作码判断一个地址是否为合约地址。
    function isContract(address addr) external  view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        } // 获取地址的代码大小
        return size > 0; // 大于 0 说明是合约地址
    }
}

contract Hello {
    // 主合约逻辑
    function destroyContract(address payable recipient) public {
        selfdestruct(recipient);  // 销毁合约并发送以太币
    }
}
/*
type(Hello).name: 获取合约的名字。
type(Hello).creationCode: 获取创建合约的字节码。
type(Hello).runtimeCode: 获取合约运行时的字节码。
*/
contract HelloType {
    function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
        return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
    }
}

