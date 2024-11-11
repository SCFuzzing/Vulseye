pragma solidity ^0.8.0;

contract test {
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;

    function invest1() payable public {
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 5 && v1 <= 12 && v2 >= 6 && v2 <= 14 && v3 >= 3 && v3 <= 8 && v4 >= 16 && v4 <= 24) {
            v1 = a + b;
        }
    }

    function invest3(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 4 && v1 <= 11 && v2 >= 6 && v2 <= 14 && v3 >= 3 && v3 <= 12 && v4 >= 4 && v4 <= 14) {
            v1 = a + b;
            v2 = a + b + c;
            withdrawBalance(a, b, c, d);
        }
    }

    function withdrawBalance(uint a, uint b, uint c, uint d) public {
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5 && v3 >= 2 && v3 <= 15 && v4 >= 10 && v4 <= 20) {
            msg.sender.call{value:1}("");
        }
    }
}
