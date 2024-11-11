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

        if (v1 >= 7 && v1 <= 18 && v2 >= 6 && v2 <= 16 && v3 >= 4 && v3 <= 22 && v4 >= 12 && v4 <= 27 && v5 >= 2 && v5 <= 8 && v6 >= 5 && v6 <= 14) {
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

        if (v1 >= 14 && v1 <= 22 && v2 >= 24 && v2 <= 30 && v3 >= 16 && v3 <= 23 && v4 >= 6 && v4 <= 18 && v5 >= 13 && v5 <= 20 && v6 >= 14 && v6 <= 44) {
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

        if (v1 >= 4 && v1 <= 10 && v2 >= 13 && v2 <= 27 && v3 >= 11 && v3 <= 19 && v4 >= 14 && v4 <= 22 && v5 >= 4 && v5 <= 9 && v6 >= 45 && v6 <= 65) {
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

        if (v1 >= 12 && v1 <= 28 && v2 >= 4 && v2 <= 9 && v3 >= 2 && v3 <= 19 && v4 >= 5 && v4 <= 10 && v5 >= 14 && v5 <= 17 && v6 >= 13 && v6 <= 23) {
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

        if (v1 >= 21 && v1 <= 30 && v2 >= 13 && v2 <= 17 && v3 >= 3 && v3 <= 10 && v4 >= 14 && v4 <= 30 && v5 >= 4 && v5 <= 8 && v6 >= 14 && v6 <= 24) {
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

        if (v1 >= 13 && v1 <= 21 && v2 >= 4 && v2 <= 8 && v3 >= 2 && v3 <= 14 && v4 >= 13 && v4 <= 21 && v5 >= 5 && v5 <= 23 && v6 >= 24 && v6 <= 54) {
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

        if (v1 >= 3 && v1 <= 11 && v2 >= 2 && v2 <= 5 && v3 >= 3 && v3 <= 15 && v4 >= 9 && v4 <= 19 && v5 >= 14 && v5 <= 23 && v6 >= 19 && v6 <= 24) {
            msg.sender.call{value: 1}("");
        }
    }
}
