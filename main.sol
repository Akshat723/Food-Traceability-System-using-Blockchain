// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract main{
    address owner;
    constructor(){
        owner=msg.sender;
    }
    uint productId=0;
    uint quantity;
    //uint transactionId;
    struct product{
        address supplier;
        uint productId;
        uint quantity;
        //uint transactionId;
        
        bool ISO22000Certified;

    }
    product[] public   products;

    modifier onlyOwner() {
        require(owner==msg.sender);
        _;
    }
    function create(address _owner,uint _pid,uint _quantity,bool _certified) public onlyOwner{         
         product memory p1=product(_owner,_pid,_quantity,_certified);
         products.push(p1);
    }
    //function certification()
}