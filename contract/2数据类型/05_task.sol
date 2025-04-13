// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

// FunctiinSecectorExample
contract Task05 {

    bytes4 public curSelector;

    function square(uint x) public pure returns(uint) {
        return x * x;
    }
    function double(uint x) public pure returns(uint) {
        return x * 2;
    }
    function getSelector(string memory signature) public  pure returns(bytes4) {
        return bytes4(keccak256(bytes(signature)));
    }
    function s() public  pure returns(bytes4) {
        return this.square.selector;
    }

    function setSelector(bytes4 selector) external  {
        curSelector = selector;
    }

    function execFunction(bytes4 selector, uint x) public  returns (uint) {
        (
            bool succ, 
            bytes memory data
        ) = address(this).call(abi.encodeWithSelector(selector, x));
        require(succ, "functiion_call_fail");
        return abi.decode(data, (uint));
    }

    function execCurSelector(uint x) external returns (uint) {
        require(curSelector != bytes4(0), "function selector is not set");
        return execFunction(curSelector, x);
    }



}