// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";



contract ErrorHandlingExample {
    uint public balance;

    function sendHalf(address addr) public payable {
        require(msg.value % 2 == 0, "Even value required."); // 输入检查
        uint balanceBeforeTransfer = address(this).balance;
        payable(addr).transfer(msg.value / 2);
        assert(address(this).balance == balanceBeforeTransfer - msg.value / 2); // 内部错误检查
    }

}

contract AssertRequireExample {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership."); // 检查调用者是否为合约所有者
        owner = newOwner;
    }

    function checkBalance(uint8 a, uint8 b) public pure returns (uint8) {
        uint8 result = a + b;
        // assert(result >= a); // 检查溢出错误
        require(result >= a, "overflow_xxx"); // 检查溢出错误
        return result;
    }
}


contract RevertExample {
    function checkValue(uint value) public pure {
        if (value > 10) {
            revert("Value cannot exceed 10"); // 返回自定义错误信息
        }
    }
}


// 自定义错误不会在错误消息中传递冗长的字符串，因此相比传统的 require 和 revert，节省了更多的 Gas。
contract CustomErrorExample {
    error Unauthorized(address caller);  // 自定义错误

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function restrictedFunction() public view  {
        if (msg.sender != owner) {
            revert Unauthorized(msg.sender);  // 使用自定义错误
        }
    }

}


contract ExternalContract {
    function getValue() public pure returns (uint) {
        return 42;
    }
    function willRevert() public pure {
        revert("This function always fails");
    }
}
contract TryCatchExample {
    ExternalContract externalContract;
    constructor() {
        externalContract = new ExternalContract();
    }
    function tryCatchTest() public view returns (uint, string memory) {
        try externalContract.getValue() returns (uint value) {
            return (value, "Success");
        } catch {
            return (0, "Failed");
        }
    }
    function tryCatchWithRevert() public view returns (string memory) {
        try externalContract.willRevert() {
            return "This will not execute";
        } catch Error(string memory reason) {
            return reason;  // 捕获错误信息
        } catch {
            return "Unknown error";
        }
    }
}