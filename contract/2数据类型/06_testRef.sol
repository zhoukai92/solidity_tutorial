// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

// 测试应用类型， storage与memory的相互传递
contract TestFef {

     uint[] public  storageArray = new uint[](5); // array of 10 elements, each with a value of
     
     
     function f0() public view  {
        uint[]  memory memArray = new uint[](5);

      //   memArray[0] = 11;
        uint a = storageArray[0];
        console.log("memArray: ", a, memArray[0]);
     }

     uint[] public x; // x 的数据存储位置是 storage
    function f2(uint[] memory memoryArray) public {
        x = memoryArray; // 将整个数组拷贝到 storage 中
        uint[] storage y = x; // 分配一个指针，y 的数据存储位置是 storage
        y[0] = 100; // 修改 y 的值，同时 x 的值也会改变
        delete x; // 清除 x，同时影响 y
    }

}