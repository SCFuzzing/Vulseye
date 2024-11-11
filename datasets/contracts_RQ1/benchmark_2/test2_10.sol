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

        if (v1 >= 5 && v1 <= 14 && v2 >= 9 && v2 <= 18 && v3 >= 6 && v3 <= 21) {
            withdrawBalance(_v1, _v2, _v3);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;

        if (v1 >= 14 && v1 <= 24 && v2 >= 10 && v2 <= 17 && v3 >= 12 && v3 <= 19) {
            msg.sender.call{value: 1}("");
        }
    }
}
