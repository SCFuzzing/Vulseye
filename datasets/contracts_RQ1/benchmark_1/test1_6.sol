pragma solidity ^0.8.0;

contract test {
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;

    function invest1(uint _v1, uint _v2) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = _v1;
        v2 = _v2;

        if (v1 >= 10 && v1 <= 50 && v2 >= 1 && v2 <= 3) {
            v1 = _v1 + _v2;
        }
    }

    function withdrawBalance(uint _v1, uint _v2) public {
        v1 = _v1;
        v2 = _v2;
        if (v1 >= 15 && v1 <= 25 && v2 >= 3 && v2 <= 8) {
            msg.sender.call{value:1}("");
        }
    }
}
