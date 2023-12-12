pragma solidity ^0.8.0;

contract time{
    address a = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    uint public icoLaunchTimestamp = 1; 


    function timestamps()public   {
	uint b = block.timestamp;
        if(b >= icoLaunchTimestamp){
        a.call{value:1}(msg.data);


}


    }
}
