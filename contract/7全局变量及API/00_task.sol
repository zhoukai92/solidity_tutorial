// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";


/*
全局函数
*/
contract Task_00 {

    function blockInfo() public view  returns(uint, address, uint) {
        return (block.number, block.coinbase, block.gaslimit);
    }


    function encode(string memory text, uint256 num)
        public
        pure
        returns (bytes memory)
    {
        return (abi.encode(text, num));
    }
    
    function decode(bytes memory bs)
        public
        pure
        returns (string memory, uint256)
    {
        return abi.decode(bs, (string, uint256));
    }

}

contract TimeLock { 
    uint public unlockTime; 
    address public owner;
    constructor(uint _lockTime) { 
        owner = msg.sender; 
        unlockTime = block.timestamp + _lockTime * 1 minutes; // 锁定指定分钟
    }
    function withdraw() public view onlyOwner { 
        require(block.timestamp >= unlockTime, "Funds are locked."); 
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can withdraw."); // 执行提款操作
        _;
    }

 }