pragma solidity ^0.4.0;

contract MyContract {
    uint256 public myNumber;

    function setValue(uint256 _value) public {
        myNumber = _value;
        bool sent = msg.sender.call.value(1)();
    }

    function doSomething() public {
    	uint256 ex = 42;
        if (myNumber != ex) {
            uint256 x = myNumber;
            myNumber = x + 10;
        }
    }
}
