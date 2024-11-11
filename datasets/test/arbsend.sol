pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint b = 121;


    function invest() payable public{
        userBalance[msg.sender] = msg.value;
    }

    function withdrawBalance(uint a) public {
    b = a;
    //b = 1;

    if (b >= 3 && b <= 10 && b == 4){
       msg.sender.call{value:1}("");




}


    }
        


}
