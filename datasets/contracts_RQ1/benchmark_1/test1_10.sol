pragma solidity ^0.8.0;

contract test {
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;

    function invest1(uint _v1, uint _v2) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = _v1;
        v2 = _v2;

        if (v1 >= 1 && v1 <= 50 && v2 >= 10 && v2 <= 20) {
            v1 = _v1 + _v2;
        }
    }

    function withdrawBalance(uint _v1, uint _v2) public {
        v1 = _v1;
        v2 = _v2;
        if (v1 >= 10 && v1 <= 20 && v2 >= 5 && v2 <= 10) {
            msg.sender.call{value:1}("");
        }
    }
}
