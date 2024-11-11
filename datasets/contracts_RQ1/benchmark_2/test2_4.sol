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

        if (v1 >= 8 && v1 <= 17 && v2 >= 10 && v2 <= 19 && v3 >= 7 && v3 <= 24) {
            withdrawBalance(_v1, _v2, _v3);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;

        if (v1 >= 14 && v1 <= 26 && v2 >= 9 && v2 <= 15 && v3 >= 12 && v3 <= 20) {
            msg.sender.call{value: 1}("");
        }
    }
}
