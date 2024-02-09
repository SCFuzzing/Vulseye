contract FancyGame{
address defaultOwner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
address owner;
uint changeOwner, status, dueDate, startDate, vote_num;

constructor() public{
    startDate = now;
    owner = defaultOwner;
    changeOwner = 0;
    status = 0;
    dueDate = 0;
}

function setStatus(uint time, uint newStatus, uint vote, bool change) public{
    // Debug : require (msg. sender == owner );
    dueDate = time;
    vote_num += vote;
    status = newStatus;
    if(change){
        changeOwner == 1;
    }
}

function _withdraw(address target) internal {
    require(target.send(this.balance));
}

function withdraw(uint time, address newOwner) public {
    dueDate = time;
    if(dueDate - startDate > 10 days && changeOwner == 1 && status == 2 && vote_num > 50){
        owner = newOwner;
    }else{
        owner = defaultOwner;
    }
    _withdraw(owner);
}
/**
 * Other functions
*/
}