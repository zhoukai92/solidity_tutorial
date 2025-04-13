// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
任务 1：基于映射创建一个简单的用户余额管理系统，并实现余额的增加与查询功能。
任务 2：扩展系统，使其能够记录每个用户的交易历史，模拟 Java 的 Map 中键集合的概念。
任务 3：结合映射与数组，实现一个简单的排行榜系统，记录并排序用户的积分。
*/
contract Task08 {

    mapping (address => uint balance) public balances;
    address[] private  users;

    function addUser(address _user) public {
        require(!contains(_user), "user_exists");
        users.push(_user);
        balances[_user] = 100;  // 将新用户的余额设置为 100
    }
    function getUsers() public view returns(address[] memory)  {
        return users;
    }

    function transfer(address to, uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount, "balance_is_not_enough");    
        require(contains(to), "to_not_exists");    


        balances[msg.sender] -= amount;
        balances[to] += amount;   // 将余额增加到指定地址
    
        Transaction memory tt;
        tt.timestamp = block.timestamp;
        tt.amount = amount;
        tt.from = msg.sender;
        tt.to = to;
        transactions[msg.sender].push(tt);
        transactions[to].push(tt);
    }

    function contains(address add) public view returns(bool) {
        for (uint i = 0; i < users.length; ++i) {   // 遍历数组
            if(users[i] == add){    // 比较元素是否相同
                return true;
            }
        }
        return false;
    }


    struct Transaction {
        uint timestamp;   // 存储时间戳
        uint amount;  // 交易的金额
        address from;     // 存储交易发起者地址
        address to;     // 存储交易接收者的地址
    }
    mapping (address => Transaction[]) private  transactions;      // 映射，以地址为键存储 History 类型的数组

    function getTransaction(address add) external view returns(Transaction[] memory){
        return transactions[add];
    }





/*
测试0值
address: 0x0000000000000000000000000000000000000000
History: tuple(uint256,uint256,address,address): 0,0,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000
*/
    function zero() public pure returns(Transaction memory) {
        Transaction memory xx;
        return xx;
    }
}