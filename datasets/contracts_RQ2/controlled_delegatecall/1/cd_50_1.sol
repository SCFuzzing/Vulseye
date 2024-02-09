pragma solidity ^0.8.0;

contract CallerContract {
    address noone = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint controlledValue = 1;
    function callOtherContract(address _contractAddress) external {
        (bool success, bytes memory result) = _contractAddress.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", controlledValue)
        );
        
        require(success, "Delegatecall failed");
    }
}