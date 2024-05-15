pragma solidity ^0.8.16;
contract victim{
    mapping (address => uint) private bountyAmount;
    uint public totalBountyAmount  = 0;
    function deposit() public payable {
        bountyAmount[msg.sender] += msg.value;
        totalBountyAmount += msg.value;
    }
    function claimBounty() public  {
        uint balance = bountyAmount[msg.sender];

        (bool success, )= msg.sender.call{value:balance}("");
        totalBountyAmount -= balance;
        bountyAmount[msg.sender] = safeSub(bountyAmount[msg.sender], balance);
    }

    function safeSub(uint a, uint b) internal pure returns(uint) {
        assertion(b <= a);
        return a - b;
    }
    function assertion(bool flag) internal pure {
        if (!flag) revert('Assertion fail.');
    }
    }

