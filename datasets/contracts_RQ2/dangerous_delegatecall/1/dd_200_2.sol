pragma solidity ^0.4.22;

contract FNBToken  {


        struct LockupInfo {
        uint256 releaseTime;
        uint256 termOfRound;
        uint256 unlockAmountPerRound;        
        uint256 lockupBalance;
    }

    string public name;
    string public symbol;
    uint8 constant public decimals =18;
    uint256 internal initialSupply;
    uint256 internal totalSupply_;

    mapping(address => uint256) internal balances;
    mapping(address => bool) internal locks;
    mapping(address => bool) public frozen;
    mapping(address => mapping(address => uint256)) internal allowed;
    mapping(address => LockupInfo[]) internal lockupInfo;

    //function totalSupply() public view returns (uint256);
    //function balanceOf(address who) public view returns (uint256);
    //function allowance(address owner, address spender) public view returns (uint256);
    //function transfer(address to, uint256 value) public returns (bool);
    //function transferFrom(address from, address to, uint256 value) public returns (bool);
    //function approve(address spender, uint256 value) public returns (bool);

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);




 address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);



    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    modifier onlyNewOwner() {
        require(msg.sender != address(0));
        require(msg.sender == newOwner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0));
        newOwner = _newOwner;
    }

    function acceptOwnership() public onlyNewOwner returns(bool) {
        emit OwnershipTransferred(owner, newOwner);        
        owner = newOwner;
        newOwner = 0x0;
    }











    address public implementation;

    // constructor() public {
    //     name = "FNB Token";
    //     symbol = "FNB";
    //     initialSupply = 2500000000; //2,500,000,000 개
    //     totalSupply_ = initialSupply * 10 ** uint(decimals);
    //     balances[owner] = totalSupply_;
    //     emit Transfer(address(0), owner, totalSupply_);
    //             owner = msg.sender;
    //     newOwner = address(0);

    // }
    
    function upgradeTo(address _newImplementation) public  {
        require(implementation != _newImplementation);
        _setImplementation(_newImplementation);
    }
    
    function totalSupply(address _target) public view returns (uint256) {
        implementationCall(_target);
    }
    function balanceOf(address who, address _target) public view returns (uint256) {
        implementationCall(_target);
    }
    
    // function allowance(address owner, address spender) public view returns (uint256) {
    //     implementationCall();
    // }
    
    function transfer(address to, uint256 value, address _target) public returns (bool) {
        implementationCall(_target);
    }
    
    function transferFrom(address from, address to, uint256 value, address _target) public returns (bool) {
        implementationCall(_target);
    }
    
    function approve(address spender, uint256 value, address _target) public returns (bool) {
        implementationCall(_target);
    }
    
    function ()  public {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)
            
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
    
    function implementationCall(address _target)  {
        address impl = implementation;
        require(impl != address(0));
        msg.sender.delegatecall(_target, bytes4(keccak256("initialize(address)")));

        // assembly {
        //     let ptr := mload(0x40)
        //     calldatacopy(ptr, 0, calldatasize)
        //     let result := delegatecall(gas, impl, ptr, calldatasize, 0, 0)
        //     let size := returndatasize
        //     returndatacopy(ptr, 0, size)
            
        //     switch result
        //     case 0 { revert(ptr, size) }
        //     default { return(ptr, size) }
        // }
    }

    function _setImplementation(address _newImp) internal {
        implementation = _newImp;
    }
}