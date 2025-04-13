// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*
任务 1：创建一个合约，定义一个结构体用于存储产品信息，包括产品 ID、名称、价格和库存。实现增加、修改和查询产品信息的功能。
任务 2：扩展合约，定义一个结构体用于存储订单信息，并实现订单的创建和查询功能，考虑如何设计结构体以便有效存储和访问订单数据。
任务 3：设计一个用户管理合约，使用结构体记录用户的个人信息、余额及交易历史，探索如何优化结构体的设计以减少存储成本。

*/
contract Task29 {
     struct Product {
        uint id;
        string name;
        uint price;
        uint stock; // 库存
    }
    mapping (uint productId => Product) products;
    uint public productCount;

    function addProduct(string memory _name, uint _price, uint _stock) public {
        productCount++;
        Product memory p = Product({id:productCount, name:_name,price:_price, stock:_stock});
        products[p.id] = p;
    }

    function updateProductStock(uint _id, uint _stock) public {
        products[_id].stock = _stock;
    }

    function getProduct(uint _id )external view returns (string memory _name, uint _price, uint _stock) {
        Product memory p = products[_id];
        return (p.name, p.price, p.stock);
    }

    // 订单
     struct Order {
        uint id;
        uint productId;
        address addr; // 用户的地址
        uint timestamp;
    }
    mapping (address userAddr => uint[] orderIds)  addr_orderIds;
    mapping (uint orderId => Order)  id_order;
    uint public orderCount;
    
    function addOrder(uint _productId) public {
        orderCount++;
        Order memory o = Order({id: orderCount, productId: _productId, addr: msg.sender, timestamp: block.timestamp});
        id_order[o.id] = o;
        addr_orderIds[msg.sender].push(o.id);
    }



}