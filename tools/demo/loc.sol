pragma solidity ^0.8.0;
contract Contract {
    address payable public owner;
    uint public contractBalance;

    function a() public payable {
        msg.sender.call{value:0}("");
    }
}


