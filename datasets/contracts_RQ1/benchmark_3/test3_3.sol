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

        if (v1 >= 6 && v1 <= 10 && v2 >= 8 && v2 <= 18 && v3 >= 4 && v3 <= 6 && v4 >= 12 && v4 <= 22) {
            v1 = a + b;
        }
    }

    function invest3(uint a, uint b, uint c, uint d) payable public {
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;

        if (v1 >= 5 && v1 <= 9 && v2 >= 3 && v2 <= 7 && v3 >= 8 && v3 <= 20 && v4 >= 10 && v4 <= 30) {
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

        if (v1 >= 1 && v1 <= 5 && v2 >= 2 && v2 <= 8 && v3 >= 4 && v3 <= 14 && v4 >= 5 && v4 <= 10) {
            msg.sender.call{value:1}("");
        }
    }
}
