pragma solidity ^0.8.0;

contract MyContract {
    uint256 public myNumber;

    function setValue(uint256 _value) public {
        myNumber = _value;
    }

    function doSomething() public {
        if (myNumber >= 42) {
        	if (myNumber < 60) {
        	        assembly{
        invalid()
        }
            	uint256 x = myNumber;
            	myNumber = x + 10;
            }
        }
    }
}
