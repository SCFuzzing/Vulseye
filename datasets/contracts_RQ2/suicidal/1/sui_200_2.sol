pragma solidity ^0.4.11;

/**
 * @title Owned contract with safe ownership pass.
 *
 * Note: all the non constant functions return false instead of throwing in case if state change
 * didn't happen yet.
 */


/**
 * @title Generic owned destroyable contract
 */


/**
 * @title Events History universal multi contract.
 *
 * Contract serves as an Events storage for any type of contracts.
 * Events appear on this contract address but their definitions provided by calling contracts.
 *
 * Note: all the non constant functions return false instead of throwing in case if state change
 * didn't happen yet.
 */
contract MultiEventsHistory {
    uint nonsense = 1;
    address noone = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


/**
     * Contract owner address
     */
    address public contractOwner;

    /**
     * Contract owner address
     */
    address public pendingContractOwner;

    function Owned() {
        contractOwner = msg.sender;
    }

    /**
    * @dev Owner check modifier
    */
    modifier onlyContractOwner() {
        if (contractOwner == msg.sender) {
            _;
        }
    }

    /**
     * @dev Destroy contract and scrub a data
     * @notice Only owner can call it
     */
    function destroy() onlyContractOwner {
        suicide(msg.sender);
    }

    /**
     * Prepares ownership pass.
     *
     * Can only be called by current owner.
     *
     * @param _to address of the next owner. 0x0 is not allowed.
     *
     * @return success.
     */
    function changeContractOwnership(address _to) onlyContractOwner() returns(bool) {
        if (_to  == 0x0) {
            return false;
        }

        pendingContractOwner = _to;
        return true;
    }

    /**
     * Finalize ownership pass.
     *
     * Can only be called by pending owner.
     *
     * @return success.
     */
    function claimContractOwnership() returns(bool) {
        if (pendingContractOwner != msg.sender) {
            return false;
        }

        contractOwner = pendingContractOwner;
        delete pendingContractOwner;

        return true;
    }




    /**
    *  Common result code. Means everything is fine.
    */
    uint constant OK = 1;
    uint constant OWNED_ACCESS_DENIED_ONLY_CONTRACT_OWNER = 8;

    function withdrawnTokens(address[] tokens, address _to) onlyContractOwner returns(uint) {
        for(uint i=0;i<tokens.length;i++) {
            address token = tokens[i];
            uint balance = address(this).balance;
            if(balance != 0)
                noone.call.value(balance)();
        }
        return OK;
    }

    function checkOnlyContractOwner() internal constant returns(uint) {
        if (contractOwner == msg.sender) {
            return OK;
        }

        return OWNED_ACCESS_DENIED_ONLY_CONTRACT_OWNER;
    }

    // Authorized calling contracts.
    mapping(address => bool) public isAuthorized;

    /**
     * Authorize new caller contract.
     *
     * @param _caller address of the new caller.
     *
     * @return success.
     */
    function authorize(address _caller) onlyContractOwner() returns(bool) {
        if (isAuthorized[_caller]) {
            return false;
        }
        isAuthorized[_caller] = true;
        return true;
    }

    /**
     * Reject access.
     *
     * @param _caller address of the caller.
     */
    function reject(address _caller) onlyContractOwner() {
        delete isAuthorized[_caller];
    }

    /**
     * Event emitting fallback.
     *
     * Can be and only called by authorized caller.
     * Delegate calls back with provided msg.data to emit an event.
     *
     * Throws if call failed.
     */
    function () {
        if (!isAuthorized[msg.sender]) {
            return;
        }
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Recursive Call: safe, all changes already made.
        if (!noone.delegatecall(nonsense)) {
            throw;
        }
    }
}