// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";


contract Test00 {
    int256[] public nums;
    // bytes public bs = "abc";
    // bytes1 public bs2 = "a";
    // bytes public age = "b";

    mapping(address => uint256) public map;

    function testStorage() public returns (string memory) {
        address add;
        delete map[add];

        return "hh";
    }

    struct Person {
        string name;
        uint8 age;
        Hobby[] hobbies;
    }
    struct Hobby {
        string name;
        string level;
    }

    function testMap() public pure returns (int256, int256) {
        return (1, 2);
    }

}
 contract TryCatchExample {
    function tryCatchDemo(address _contractAddress) public returns(uint) {
        // 尝试调用外部合约的函数
        try ExternalContract(_contractAddress).someFunction() returns (bool) {
        // 处理成功
        console.log("succ_");
        return 100;
        } catch {
        // 处理失败
        console.log("fail_");
        return 22;
        }
    }
}

contract ExternalContract {
    function someFunction() public returns (bool) {
    // 可能抛出异常的函数
        uint x = 1;
        uint y = 2;
        uint z = x / y;
        return z == 0;
    }
}