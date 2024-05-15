pragma solidity ^0.8.0;

contract MyContract {
    int256 public myNumber;

    function setValue(int256 _value) public {
        myNumber = _value;
    }

    function doSomething() public {
        if (myNumber >= -42) {
            int256 x = myNumber;
            myNumber = x + 10;
        }
    }
}