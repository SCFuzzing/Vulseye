pragma solidity ^0.8.0;

contract SuicidalContract {
    address public owner;
    uint a;
    address ad;
    mapping( address => uint) amount;

    constructor() {
        owner = msg.sender;
    }

    function destroy() external {
        if(ad != owner){
            a = 0;

        }
        if(amount[msg.sender] > 1){
            a = 1;
        }

        selfdestruct(payable(owner));
    }
}

