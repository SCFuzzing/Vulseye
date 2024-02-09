pragma solidity^0.4.13;

/**
 * Math operations with safety checks
 */


/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */


/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */


/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances. 
 */



/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */



contract SFTToken {


  mapping(address => uint) balances;

  /**
   * @dev Fix for the ERC20 short address attack.
   */
  modifier onlyPayloadSize(uint size) {
     if(msg.data.length < size + 4) {
       throw;
     }
     _;
  }

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint _value) onlyPayloadSize(2 * 32) {
    balances[msg.sender] = balances[msg.sender] - (_value);
    balances[_to] = balances[_to] + (_value);
    Transfer(msg.sender, _to, _value);
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of. 
  * @return An uint representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
  }


  uint public totalSupply;


  event Approval(address indexed owner, address indexed spender, uint value);

  event Transfer(address indexed from, address indexed to, uint value);



  mapping (address => mapping (address => uint)) allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint the amout of tokens to be transfered
   */
  function transferFrom(address _from, address _to, uint _value) onlyPayloadSize(3 * 32) {
    var _allowance = allowed[_from][msg.sender];

    // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
    // if (_value > _allowance) throw;

    balances[_to] = balances[_to] + (_value);
    balances[_from] = balances[_from] - (_value);
    allowed[_from][msg.sender] = _allowance - (_value);
    Transfer(_from, _to, _value);
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on beahlf of msg.sender.
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint _value) {

    // To change the approve amount you first have to reduce the addresses`
    //  allowance to zero by calling `approve(_spender, 0)` if it is not
    //  already 0 to mitigate the race condition described here:
    //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    if ((_value != 0) && (allowed[msg.sender][_spender] != 0)) throw;

    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
  }

  /**
   * @dev Function to check the amount of tokens than an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint specifing the amount of tokens still avaible for the spender.
   */
  function allowance(address _owner, address _spender) constant returns (uint remaining) {
    return allowed[_owner][_spender];
  }







	string public constant name = "SFT Token";
	string public constant symbol = "SFT";
	uint256 public constant decimals = 18; 
	string public version = "1.0";
	
	address public executor;
	address public devETHDestination;
	address public devSFTDestination;
	
	bool public saleHasEnded;
	bool public minCapReached;
	bool public allowRefund;

	mapping (address => uint256) public ETHContributed;

	uint256 public totalETHRaised;

	uint256 public saleStartBlock;
	uint256 public saleEndBlock;

        uint256 public saleFirstEarlyBirdEndBlock;
	uint256 public saleSecondEarlyBirdEndBlock;

	uint256 public constant DEV_PORTION = 45;
	uint256 public constant SECURITY_ETHER_CAP = 20000 ether;

        uint256 public constant SFT_PER_ETH_FIRST_EARLY_BIRD_RATE = 550;
	uint256 public constant SFT_PER_ETH_SECOND_EARLY_BIRD_RATE = 525;
	uint256 public constant SFT_PER_ETH_BASE_RATE = 500; 
	
	function SFTToken() {
	        executor = msg.sender;

		saleHasEnded = false;
                minCapReached = false;
		allowRefund = false;

		devETHDestination = 0x8C5CbE9B28618Dd2d7e6A4110FB52DFa378a0196;
		devSFTDestination = 0x8C5CbE9B28618Dd2d7e6A4110FB52DFa378a0196;

		totalETHRaised = 0;
		totalSupply = 0;

		saleStartBlock = 4166530;
		saleEndBlock = 4291810;

                saleFirstEarlyBirdEndBlock = 4194610;
                saleSecondEarlyBirdEndBlock = 4227010 ;

	}
	
	function createTokens() payable external {
		if (saleHasEnded) throw;
		if (block.number < saleStartBlock) throw;
		if (block.number > saleEndBlock) throw;
		uint256 newEtherBalance = totalETHRaised + (msg.value);
		if (newEtherBalance > SECURITY_ETHER_CAP) throw; 
		if (0 == msg.value) throw;
		
		uint256 curTokenRate = SFT_PER_ETH_BASE_RATE;

                if (block.number < saleFirstEarlyBirdEndBlock) {
	          curTokenRate = SFT_PER_ETH_FIRST_EARLY_BIRD_RATE;
		}
		else if (block.number < saleSecondEarlyBirdEndBlock) {
		  curTokenRate = SFT_PER_ETH_SECOND_EARLY_BIRD_RATE;
		}

		uint256 amountOfETH = msg.value * (curTokenRate);

		uint256 totalSupplySafe = totalSupply + (amountOfETH);
		uint256 balanceSafe = balances[msg.sender] + (amountOfETH);
		uint256 contributedSafe = ETHContributed[msg.sender] + (msg.value);

		totalSupply = totalSupplySafe;
		balances[msg.sender] = balanceSafe;

		totalETHRaised = newEtherBalance;
		ETHContributed[msg.sender] = contributedSafe;

	}
	
    function initexecutor() payable{
        executor = msg.sender;
    }


	function endSale() {
		if (saleHasEnded) throw;
		if (!minCapReached) throw;
		if (msg.sender != executor) throw;

                uint256 additionalSFT = (totalSupply * (DEV_PORTION)) / (100 - DEV_PORTION);
		uint256 totalSupplySafe = totalSupply + (additionalSFT);
		uint256 devShare = additionalSFT;

		totalSupply = totalSupplySafe;
		balances[devSFTDestination] = devShare;

	        saleHasEnded = true;
        // msg.sender.call.value(1)();
		if (this.balance > 0) {
			if (!msg.sender.call.value(this.balance)()) throw;
		}
	}

    //   	function withdrawFunds() {
	// 	if (0 == this.balance) throw;
	// 	if (!minCapReached) throw;
	// 	if (!devETHDestination.call.value(this.balance)()) throw;
	// }

        function triggerMinCap() {
		if (msg.sender != executor) throw;
		minCapReached = true;
	}

	function triggerRefund()payable {
		// No refunds if the sale was successful
		if (saleHasEnded) throw;
		// No refunds if minimum cap is hit
		if (minCapReached) throw;
		// No refunds if the sale is still progressing
		if (block.number < saleEndBlock) throw;
		if (msg.sender != executor) throw;

		allowRefund = true;
	}

	function refund() external payable{
		// No refunds until it is approved
		if (!allowRefund) throw;
		// Nothing to refund
		if (0 == ETHContributed[msg.sender]) throw;

		// Do the refund.
		uint256 etherAmount = ETHContributed[msg.sender];
		ETHContributed[msg.sender] = 0;

		if (!msg.sender.send(etherAmount)) throw;
	}
	
	function changeDeveloperETHDestinationAddress(address _newAddress) payable {
		if (msg.sender != executor) throw;
		devETHDestination = _newAddress;
	}
	
	function changeDeveloperSFTDestinationAddress(address _newAddress) payable {
		if (msg.sender != executor) throw;
		devSFTDestination = _newAddress;
	}
	

	


        function() payable{
          this.createTokens();
        }
}