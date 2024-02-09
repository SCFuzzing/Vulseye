pragma solidity ^0.8.0;

contract CallerContract {
    address a = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    function callOtherContract(address _contractAddress, uint _newValue) external {
        (bool success, bytes memory result) = a.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _newValue)
        );
        
        require(success, "Delegatecall failed");
    }
}
