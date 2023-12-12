
pragma solidity ^0.8.0;

contract MyContract {
    int256 public myNumber1;
    int256 public myNumber2;
    uint256 public myNumber3;


    function setValue(int256 _value1, int256 _value2, uint256 _value3) public {
        myNumber1 = _value1;
        myNumber2 = _value2;
        myNumber3 = _value3;
    }

    function doSomething() public {
        if (myNumber1 >= 42) {
            if (myNumber2 < 52){
                if(myNumber3 == 62){
                    int256 x = myNumber1;
                    myNumber1 = x + 10;
                }  
            }
            
        }
    }
}
