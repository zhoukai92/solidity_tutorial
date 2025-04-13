// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";


contract Lesson07 {
    uint[10] tens;  // 一个长度为 10 的 uint 类型静态数组
    string[4] adaArr = ["This", "is", "an", "array"];  // 初始化的静态数组

    uint[] many;  // 一个动态长度的uint类型数组
    uint[] public u = [1, 2, 3];  // 动态数组的初始化
    uint[] arr5 = new uint[](5);

    function f0(uint[] calldata nums) public pure  returns (uint[] memory) {
        uint[] memory slice = nums[1:3];  // 创建数组切片
        return slice;
    }
    


    function sliceArray(bytes calldata _payload) external {
        bytes4 sig = abi.decode(_payload[:4], (bytes4));  // 解码函数选择器
        address owner = abi.decode(_payload[4:], (address));  // 解码地址
    }

}
