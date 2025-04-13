// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
实践练习：
编写合约，允许用户动态管理一个地址数组。
实现一个函数，接收数组作为参数并返回其元素之和。
创建一个函数，删除数组中的特定元素并调整数组长度。
*/
contract Task07 {

    // 允许用户动态管理一个地址数组。
    // 使用int8演示
    int8[] public nums ;
    function del(uint8 idx) public {
        // int8[] storage new_nums;
        // new_nums.push(1);

    }


    function setNums(int8[] calldata _nums) public {
        nums = _nums;
    }
    function getNums() public view returns (int8[] memory) {
        return nums;
    }
    

    // 实现一个函数，接收数组作为参数并返回其元素之和。
    function f1_sum(uint[] calldata nums) public pure  returns (uint) {
        uint sum = 0;
        for( uint i=0 ; i < nums.length ; ++i ) {
            sum += nums[i];
        }
        return sum;
    }
    // 删除数组中的特定元素并调整数组长度。
  function remove(uint[] calldata nums, uint8 idx) public pure  returns (uint[] memory) {
        require(idx < nums.length, "index out of bounds");
        uint[] memory _nums = new uint[](nums.length -1);
        for (uint i = 0 ;i< idx; i++){
            _nums[i] = nums[i];
        }
        for (uint i = idx + 1; i < nums.length ; i++) {
            _nums[i - 1] = nums[i];
        }

        return _nums;
    }

}