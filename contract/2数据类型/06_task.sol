// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
请编写一个 Solidity 智能合约，实现以下功能：

数组的操作：合约中包含一个 storage 存储的动态数组 data。编写一个函数 updateData(uint[] memory newData)，该函数接收一个 memory 数组并将其内容复制到 data 中。然后通过另一个函数 getData() 返回 data 数组。

引用类型的行为：在合约中编写两个函数：

modifyStorageData(uint index, uint value)：修改 data 数组中指定索引位置的值。
modifyMemoryData(uint[] memory memData)：尝试修改传入的 memory 数组，并返回修改后的数组。
*/
contract Task06 {

    uint[] public data;

    function setDate(uint[] memory _data) public {
        data = _data;
    }

    function getData() view public returns (uint256[] memory) {
         return data;
    }
    function modifyData(uint8 idx, uint num) public {
        require(idx < data.length, "Index out of bound.");
        console.log("index is", idx);
        console.log("num is ", data[idx]); 
        data[idx] = num;
    }

    function updateMemoryArray(uint[] memory nums) public pure returns(uint[] memory) {
        console.log(nums.length); 
        require(nums.length > 0, "nums is blank");
        nums[0] = 22;
        return nums;
    }
}