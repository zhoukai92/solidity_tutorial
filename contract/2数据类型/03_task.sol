// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
SimpleWallet: 用户向合约中存取钱
*/
contract Task03   {

    mapping (address => uint balance) public balances;

    // 存钱
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        console.log("address %s's balance is:%d", balances[msg.sender]);
    }
    // 取钱
    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "insufficient balance");
        balances[msg.sender] -= amount;
        address payable add = payable(msg.sender);
        add.transfer(amount);
    }

    function checkBalance() public view returns(uint) {
        return balances[msg.sender];
    }

    // 使用 selfdestruct 函数销毁合约，同时将合约中的以太币发送到指定地址。
    // function destroyContract() public {
    //     selfdestruct(payable(msg.sender));
    // }

// SimpleWallet
    function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
       return (
            type(Hello).name,
            type(Hello).creationCode,
            type(Hello).runtimeCode
       );
    }
    // 断一个地址是否为合约地址。
    function isContract(address addr) external  view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(addr) }  // 获取地址的代码大小
        return size > 0;  // 大于 0 说明是合约地址
    }
}
contract Hello {
    // 主合约逻辑
}

