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

        if (v1 >= 5 && v1 <= 18 && v2 >= 9 && v2 <= 17 && v3 >= 6 && v3 <= 22) {
            withdrawBalance(_v1, _v2, _v3);
        }
    }

    function withdrawBalance(uint _v1, uint _v2, uint _v3) public {
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;

        if (v1 >= 12 && v1 <= 21 && v2 >= 7 && v2 <= 14 && v3 >= 10 && v3 <= 17) {
            msg.sender.call{value: 1}("");
        }
    }
}
