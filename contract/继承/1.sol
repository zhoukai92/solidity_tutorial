// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

contract Car {
    uint private speed ;

    function drive() virtual pure public  {

    }
}
contract ElectricCar is Car {
    uint private batteryLevel ;
    
    function drive() pure public override  {

    }
}


//  ---------------------------------------

contract Person {

    function f0() virtual public  pure {

    }
}


contract Employee {
    function f2() virtual public  pure {

    }
}

contract Manager is Person, Employee {
    function f2() virtual public  pure override  {

    }
}



//  ---------------------------------------
// 编写一个抽象合约 Shape ，包括一个纯虚函数 area，然后编写两个合约 Square 和 Circle 继承 Shape，并实现 area 函数。


abstract contract Shape {
    function area() virtual internal;
}
contract Square is Shape {
    function area() override  internal   {
        
    }
}
contract Circle is Shape {
    function area() virtual override    internal   {
        
    }
}