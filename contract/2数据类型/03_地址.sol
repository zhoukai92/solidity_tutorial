// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
address 类型详解
*/
contract Lesson03   {
    address public immutable owner = msg.sender;

    function same(address add1, address add2) public pure returns(bool) {
        return add1 == add2;
    }
    function balance(address add) public view returns(uint256) {
        return add.balance;    
    }

//  transfer() 方法将以太币转移到另一个地址，推荐使用这种方法。
    function transfer(address payable recipient) public payable  {
        recipient.transfer(msg.value);
    }

    // send() 方法转移以太币，返回布尔值表示转移是否成功。由于没有自动回退机制，不推荐使用
    function send(address payable recipient) public payable  {
        bool succ = recipient.send(msg.value);
        require(succ, "send_fail");
    }
    
    
    function call(address payable recipient) public payable  {
        (bool succ, ) = recipient.call{value: msg.value}("");
        require(succ, "call_fail");
    }

}

