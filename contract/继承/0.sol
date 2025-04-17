// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

contract Owned {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function setOwner(address _owner) public virtual {
        owner = payable(_owner);
    }
}

contract Mortal is Owned {
    event SetOwner(address indexed owner);

    function kill() public {
        if (msg.sender == owner) selfdestruct(owner);
    }

    function setOwner(address _owner) public override {
        super.setOwner(_owner); // 调用父合约的 setOwner
        emit SetOwner(_owner);
    }
}

abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}

contract B is A(1) {
    uint public b;

    constructor() {
        b = 2;
    }
}

contract C is A {
    uint public b;

    constructor() A(1) {
        b = 2;
    }
}

//  ---------------------------------------
contract Base {
    function foo() virtual public {}
}
contract Middle is Base {}

contract Inherited is Middle {
    function foo() public override {}
}

//  ---------------------------------------

contract Base1 {
    function foo() virtual public {}
}

contract Base2 {
    function foo() virtual public {}
}

contract Inherited2 is Base1, Base2 {
    function foo() public override(Base1, Base2) {}
}







