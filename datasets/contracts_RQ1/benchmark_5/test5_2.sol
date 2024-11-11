pragma solidity ^0.8.0;

contract test {
    mapping(address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;
    uint v5 = 0;
    uint v6 = 0;

    function invest1() payable public {
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 5 && v1 <= 18 && v2 >= 6 && v2 <= 15 && v3 >= 3 && v3 <= 20 && v4 >= 10 && v4 <= 25 && v5 >= 3 && v5 <= 9 && v6 >= 5 && v6 <= 15) {
            invest1();
        }
    }

    function invest3(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 15 && v1 <= 22 && v2 >= 23 && v2 <= 29 && v3 >= 17 && v3 <= 21 && v4 >= 6 && v4 <= 18 && v5 >= 14 && v5 <= 20 && v6 >= 12 && v6 <= 40) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3;
            v4 = _v1 + _v2 + _v3 + _v4;
        }
    }

    function invest4(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 4 && v1 <= 10 && v2 >= 13 && v2 <= 28 && v3 >= 11 && v3 <= 18 && v4 >= 15 && v4 <= 24 && v5 >= 5 && v5 <= 10 && v6 >= 40 && v6 <= 65) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3;
        }
    }

    function invest5(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 12 && v1 <= 28 && v2 >= 5 && v2 <= 9 && v3 >= 3 && v3 <= 18 && v4 >= 5 && v4 <= 10 && v5 >= 15 && v5 <= 17 && v6 >= 13 && v6 <= 23) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3;
        }
    }

    function invest6(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 22 && v1 <= 30 && v2 >= 12 && v2 <= 17 && v3 >= 3 && v3 <= 10 && v4 >= 14 && v4 <= 32 && v5 >= 5 && v5 <= 8 && v6 >= 13 && v6 <= 24) {
            v1 = _v1 + _v2;
            v2 = _v1 + _v2 + _v3;
        }
    }

    function invest7(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) payable public {
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 14 && v1 <= 20 && v2 >= 5 && v2 <= 9 && v3 >= 3 && v3 <= 15 && v4 >= 13 && v4 <= 21 && v5 >= 6 && v5 <= 22 && v6 >= 22 && v6 <= 55) {
            withdrawBalance(_v1, _v2, _v3, _v4, _v5, _v6);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3, uint _v4, uint _v5, uint _v6) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;

        if (v1 >= 3 && v1 <= 11 && v2 >= 2 && v2 <= 6 && v3 >= 3 && v3 <= 16 && v4 >= 9 && v4 <= 19 && v5 >= 12 && v5 <= 25 && v6 >= 18 && v6 <= 23) {
            msg.sender.call{value: 1}("");
        }
    }
}
