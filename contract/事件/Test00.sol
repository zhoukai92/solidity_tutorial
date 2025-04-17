// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";


contract Test00 {

    mapping (address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 100;
    }

    // event transfer(address indexed from, address indexed to, uint256 value);
    /*
    logs:
	[
	{
		"from": "0x5FD6eB55D12E759a21C09eF703fe0CBa1DC9d88D",
		"topic": "0xbeabacc8ffedac16e9a60acdb2ca743d80c2ebb44977a93fa8e483c74d2b35a8",
		"event": "transfer",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
			"2": "2",
			"from": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"to": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
			"value": "2"
		}
	}
]    
    */
    // 可用于查看日志
    event transfer(address from, address to, uint256 value);

    function sendCoin(address receiver, uint amount) public returns(bool succ) {
        require(balances[msg.sender] >= amount, "balance_is_not_enough");
        balances[receiver] += amount;  //记录发送者地址对应的余额
        balances[msg.sender] -= amount;    //扣除发送金额
        emit transfer(msg.sender, receiver, amount);

        return true;
    }
    
    function test00(address to, uint amount) payable public returns (bool succ, uint a) {
        return (true, 1);
    }
}