// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";



contract Lesson00 {

    function fun_require(bool flag) public pure returns(uint){
        require(flag, "flag is false");
        return 1;
    }

    function fun_assert(bool flag) public pure returns(uint){
        assert(flag);
        return 1;
    }

// 立即停止执行并回滚状态
    function fun_revert(bool flag) public pure returns(uint){
        if (!flag) {
            revert();
        }
        return 1;
    }
    
    error Unauthorized(address caller);  // 自定义错误

    function fun_revert_err(bool flag) public view returns(uint){
        if (!flag) {
            revert Unauthorized(msg.sender);
        }
        return 1;
    }
}

contract TestTry {
    Lesson00 public lesson = new Lesson00();

// fun_require fun_assert  fun_revert  fun_revert_err
    function fun0(bool flag) public view returns (string memory){
        try lesson.fun_revert_err(flag) returns(uint) {
            return "succ";
        }catch Error(string memory err) { // 对应 fun_require
            return string.concat("error-", err);
        }catch Panic(uint code) { // fun_assert
            console.log(code);
            return string.concat("panic-");
        }catch (bytes memory bs) { // fun_revert
            return string.concat("other-",  string(bs));
        }
    }
    // Failed to decode output: null: invalid codepoint at offset 6; unexpected continuation byte (argument="bytes", value=Uint8Array(0x6f746865722d8e4a23d6000000000000000000000000d7ca4e那么99f7c171b9ea2de80d3363c47009afac5f), code=INVALID_ARGUMENT, version=strings/5.7.0
}