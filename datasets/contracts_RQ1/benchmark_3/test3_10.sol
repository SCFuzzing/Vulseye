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

        if (v1 >= 10 && v1 <= 20 && v2 >= 5 && v2 <= 15 && v3 >= 7 && v3 <= 12 && v4 >= 10 && v4 <= 22) {
            v1 = a + b;
        }
    }

    function invest3(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 12 && v1 <= 25 && v2 >= 4 && v2 <= 10 && v3 >= 5 && v3 <= 15 && v4 >= 8 && v4 <= 19) {
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

        if (v1 >= 9 && v1 <= 18 && v2 >= 1 && v2 <= 5 && v3 >= 3 && v3 <= 14 && v4 >= 6 && v4 <= 10) {
            msg.sender.call{value:1}("");
        }
    }
}
