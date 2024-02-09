pragma solidity ^0.4.19;

contract BdpEntryPoint {

    address public ownerAddress;

	address public managerAddress;

	address public contracts;

	bool public paused = false;

	bool public setupCompleted = false;

	bytes8 public version;

	function callproxy (address contracts) payable public {
        bytes memory data = msg.data;
        contracts.delegatecall(paused);
        msg.sender.call.value(msg.value)();

    }

	function BdpEntryPoint(address _contracts, bytes8 _version) public {
        ownerAddress = msg.sender;
        managerAddress = msg.sender;		
        contracts = _contracts;		
        setupCompleted = true;
        version = _version;
	}
}