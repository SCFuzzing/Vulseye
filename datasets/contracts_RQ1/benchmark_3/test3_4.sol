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

        if (v1 >= 7 && v1 <= 20 && v2 >= 3 && v2 <= 10 && v3 >= 5 && v3 <= 15 && v4 >= 8 && v4 <= 25) {
            v1 = a + b;
        }
    }

    function invest3(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 10 && v1 <= 22 && v2 >= 6 && v2 <= 12 && v3 >= 4 && v3 <= 8 && v4 >= 9 && v4 <= 15) {
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

        if (v1 >= 8 && v1 <= 12 && v2 >= 4 && v2 <= 9 && v3 >= 6 && v3 <= 18 && v4 >= 7 && v4 <= 14) {
            msg.sender.call{value:1}("");
        }
    }
}
