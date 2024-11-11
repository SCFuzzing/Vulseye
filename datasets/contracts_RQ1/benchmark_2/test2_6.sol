pragma solidity ^0.8.0;

contract test {
    mapping(address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;

    function invest1() payable public {
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1, uint _v2, uint _v3) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;

        if (v1 >= 7 && v1 <= 16 && v2 >= 11 && v2 <= 20 && v3 >= 4 && v3 <= 23) {
            withdrawBalance(_v1, _v2, _v3);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;

        if (v1 >= 14 && v1 <= 24 && v2 >= 8 && v2 <= 16 && v3 >= 13 && v3 <= 21) {
            msg.sender.call{value: 1}("");
        }
    }
}
