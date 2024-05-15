pragma solidity ^0.8.0;

contract blocknumber{
    address a = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    uint public blocknumber = 15117; 


    function aa()public   {
        require(block.number >= blocknumber);
        a.call{value:1}(msg.data);
    }
}
