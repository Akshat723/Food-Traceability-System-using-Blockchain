// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrganicFoodTraceability {
    struct Product {
        uint256 id;
        string name;
        string description;
        bool isOrganic;
        address producer;
        address[] supplyChain;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductTransferred(uint256 indexed productId, address indexed from, address indexed to);

    function addProduct(string memory _name, string memory _description, bool _isOrganic, address _producer) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _description, _isOrganic, _producer, new address[](0));
    }

    function transferProduct(uint256 _productId, address _newOwner) public {
        Product storage product = products[_productId];
        require(msg.sender == product.supplyChain[product.supplyChain.length - 1], "Only the current owner can transfer the product.");
        product.supplyChain.push(_newOwner);
        emit ProductTransferred(_productId, msg.sender, _newOwner);
    }

    function getProduct(uint256 _productId) public view returns (Product memory) {
        return products[_productId];
    }

    function getSupplyChain(uint256 _productId) public view returns (address[] memory) {
        return products[_productId].supplyChain;
    }
    
    function isProductOrganic(uint256 _productId) public view returns (bool) {
        return products[_productId].isOrganic;
    }
    
    function getProducer(uint256 _productId) public view returns (address) {
        return products[_productId].producer;
    }
}
