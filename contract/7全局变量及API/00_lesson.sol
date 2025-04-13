// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";


/*
全局变量、API
*/
contract GalobalVari {
        
    function pay() public payable  returns (address, uint, uint, bytes4, bytes memory) {
        address sender = msg.sender;
        uint value = msg.value;
        // uint gas = msg.gas; // deprecate，推荐使用 gasleft
        uint gas = gasleft();
        bytes4 sig = msg.sig;
        bytes memory bs = msg.data;
        return (sender, value, gas, sig, bs);
    }
    function tes_add()
        public
        view
        returns (
            address,
            uint256
        )
    {
        address add = address(this);
        uint256 balance = add.balance;
        return (add, balance);
    }
    
    function test_block()
        public
        view
        returns (
            uint,
            uint,
            uint,
            uint
        )
    {        
        return (block.basefee
        , block.timestamp
        , block.number
        , block.chainid
        );
    }

    // 1. 编码
    function encode(string memory name, uint256 num)
        public
        pure
        returns (bytes memory, bytes memory)
    {
        return (abi.encode(name, num), abi.encodePacked(name, name));
    }

    // 2. 解码
    function decode(bytes memory bs)
        public
        pure
        returns (string memory, uint256)
    {
        return abi.decode(bs, (string, uint256));
    }

    // 3. 获取当前函数的签名
    function getSelector() public pure returns (bytes4, bytes memory) {
        bytes4 sig = msg.sig;
        bytes memory data = msg.data;
        return (sig, data);
    }

    // 4. 计算函数选择器
    function computeSelector(string memory func) public pure returns (bytes4) {
        bytes32 a = keccak256(bytes(func));
        return bytes4(a);
    }

    /*
0x034899bc
0x034899bcab10caf94c6645da13225bbc98a3cbfcd149b0ee7d18b521733a1adb
*/
    function transfer(address _to, uint256 amount)
        public
        pure
        returns (bytes memory)
    {
        return msg.data;
    }
    // 0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000003
    // 0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000003
    // 5. 调用函数生成 msg.data
    function encodeFunc() public pure returns (bytes memory) {
        bytes memory bs = abi.encodeWithSignature(
            "transfer(address,uint256)",
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
            3
        );
        return bs;
    }


    // 6. hash
    function hashFunc(string memory text)
        public
        pure
        returns (
            bytes32,
            bytes32,
            bytes32
        )
    {
        bytes memory bs = abi.encodePacked(text);
        return (keccak256(bs), sha256(bs), ripemd160(bs));
    }

    // 7. 数学运算
    function mathFunc(
        uint256 x,
        uint256 y,
        uint256 k
    ) public pure returns (uint256, uint256) {
        return (
            addmod(x, y, k),
            mulmod(x, y, k)
         );
    }

    // 8. 椭圆曲线回复地址
    function recoverAddress(bytes32 bs, uint8 v, bytes32 r, bytes32 s) public pure returns (address){
        return ecrecover(bs, v, r, s);
    }
       
    /*
    函数选择器
        是通过对函数签名（函数名及其参数类型）进行 Keccak256 哈希计算，
        并截取前 4 个字节生成的唯一标识符。它用于识别和调用特定函数。
    */
    function a1() public pure returns(bytes4){
        // return bytes4(keccak256("square(uint)"));
        return bytes4(keccak256("square(uint256)"));
    }
    // Solidity 内置获取选择器的方法：
    function a0() public pure returns(bytes4){
        bytes4 bs4 = this.square.selector;
        return bs4;
    }
    function square(uint x) public pure returns (uint) {
        return x * x;
    }
 
    function select(bytes4 selector, uint x) external returns (uint z) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }

    // 第四节：时间单位及其应用
    function testTime(uint cnt) public pure returns(uint) {
        return cnt * 1 minutes;
    }

}
