pragma solidity ^0.8.0;

contract test {
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;
    uint v5 = 0;

    function invest1() payable public {
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) payable public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
        if (v1 >= 12 && v1 <= 24 && v2 >= 4 && v2 <= 12 && v3 >= 10 && v3 <= 18 && v4 >= 8 && v4 <= 16 && v5 >= 6 && v5 <= 14) {
            invest1();
        }
    }

    function invest3(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) payable public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
        if (v1 >= 8 && v1 <= 16 && v2 >= 25 && v2 <= 40 && v3 >= 5 && v3 <= 12 && v4 >= 9 && v4 <= 18 && v5 >= 3 && v5 <= 12) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3 + _v4;
        }
    }

    function invest4(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) payable public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
        if (v1 >= 6 && v1 <= 14 && v2 >= 4 && v2 <= 10 && v3 >= 12 && v3 <= 18 && v4 >= 7 && v4 <= 15 && v5 >= 8 && v5 <= 14) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3;
        }
    }

    function invest5(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) payable public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
        if (v1 >= 5 && v1 <= 10 && v2 >= 3 && v2 <= 8 && v3 >= 12 && v3 <= 16 && v4 >= 8 && v4 <= 14 && v5 >= 9 && v5 <= 16) {
            withdrawBalance(_v1, _v2, _v3, _v4, _v5);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        if (v1 >= 5 && v1 <= 10 && v2 >= 2 && v2 <= 6 && v3 >= 8 && v3 <= 16 && v4 >= 7 && v4 <= 14 && v5 >= 10 && v5 <= 18) {
            msg.sender.call{value:1}("");
        }
    }
}
