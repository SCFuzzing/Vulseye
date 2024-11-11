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
        if (v1 >= 10 && v1 <= 20 && v2 >= 5 && v2 <= 15 && v3 >= 18 && v3 <= 30 && v4 >= 12 && v4 <= 22 && v5 >= 10 && v5 <= 18) {
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
        if (v1 >= 12 && v1 <= 28 && v2 >= 30 && v2 <= 45 && v3 >= 10 && v3 <= 14 && v4 >= 5 && v4 <= 19 && v5 >= 3 && v5 <= 10) {
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
        if (v1 >= 3 && v1 <= 9 && v2 >= 5 && v2 <= 12 && v3 >= 10 && v3 <= 18 && v4 >= 4 && v4 <= 16 && v5 >= 6 && v5 <= 14) {
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
        if (v1 >= 3 && v1 <= 10 && v2 >= 6 && v2 <= 15 && v3 >= 8 && v3 <= 12 && v4 >= 5 && v4 <= 18 && v5 >= 7 && v5 <= 16) {
            withdrawBalance(_v1, _v2, _v3, _v4, _v5);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        if (v1 >= 2 && v1 <= 8 && v2 >= 3 && v2 <= 6 && v3 >= 5 && v3 <= 14 && v4 >= 9 && v4 <= 18 && v5 >= 12 && v5 <= 20) {
            msg.sender.call{value:1}("");
        }
    }
}
