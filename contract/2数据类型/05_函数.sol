// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

// FunctiinSecectorExample
contract Lesson05 {

    function select(bytes4 selector, uint x) external returns (uint) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }

    function f0(uint a) external   pure returns(uint) {
         return a;
    }

    function f0_selector() public pure returns(bytes4) {
         return this.f0.selector;
    }

    function f0_selector_abi() public pure returns(bytes4) {
         return bytes4(keccak256("f0(uint256)"));
    }

}