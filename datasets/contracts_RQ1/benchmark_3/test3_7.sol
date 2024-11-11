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

        if (v1 >= 4 && v1 <= 14 && v2 >= 7 && v2 <= 15 && v3 >= 2 && v3 <= 5 && v4 >= 11 && v4 <= 18) {
            v1 = a + b;
        }
    }

    function invest3(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 1 && v1 <= 5 && v2 >= 8 && v2 <= 14 && v3 >= 4 && v3 <= 9 && v4 >= 6 && v4 <= 12) {
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

        if (v1 >= 5 && v1 <= 15 && v2 >= 7 && v2 <= 13 && v3 >= 9 && v3 <= 18 && v4 >= 10 && v4 <= 20) {
            msg.sender.call{value:1}("");
        }
    }
}
