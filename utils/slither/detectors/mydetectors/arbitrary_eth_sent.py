"""
    Module detecting send to arbitrary address

    To avoid FP, it does not report:
        - If msg.sender is used as index (withdraw situation)
        - If the function is protected
        - If the value sent is msg.value (repay situation)
        - If there is a call to transferFrom

    TODO: dont report if the value is tainted by msg.value
"""
from typing import List

from slither.core.cfg.node import Node
from slither.core.declarations import Function, Contract
from slither.analyses.data_dependency.data_dependency import is_tainted, is_dependent
from slither.core.declarations.solidity_variables import (
    SolidityFunction,
    SolidityVariableComposed,
)
from slither.detectors.abstract_detector import AbstractDetector, DetectorClassification
from slither.slithir.operations import (
    HighLevelCall,
    Index,
    LowLevelCall,
    Send,
    SolidityCall,
    Transfer,
)


# pylint: disable=too-many-nested-blocks,too-many-branches
from slither.utils.output import Output

#TODO
def arbitrary_send(func: Function):
    #TODO
    #if func.is_protected():
        #print("Protected")
        #print(func.full_name,"\n\n")
        #return []
    #print("Not Protected")
    #print(func.full_name)

    ret: List[Node] = []
    for node in func.nodes:
        for ir in node.irs:
            if isinstance(ir, SolidityCall):
                if ir.function == SolidityFunction("ecrecover(bytes32,uint8,bytes32,bytes32)"):
                    #print("1\n")
                    return False
            if isinstance(ir, Index):
                if ir.variable_right == SolidityVariableComposed("msg.sender"):
                    #print("2\n")
                    return False
                if is_dependent(
                    ir.variable_right,
                    SolidityVariableComposed("msg.sender"),
                    func.contract,
                ):
                    #print("3\n")
                    return False
            if isinstance(ir, (HighLevelCall, LowLevelCall, Transfer, Send)):
                if isinstance(ir, (HighLevelCall)):
                    if isinstance(ir.function, Function):
                        if ir.function.full_name == "transferFrom(address,address,uint256)":
                            print("4\n")
                            return False
                if ir.call_value is None:
                    #print("5\n")
                    continue
                #TODO
                if ir.call_value and ir.call_value == 0:
                    #print("6\n")
                    continue
                if ir.call_value == SolidityVariableComposed("msg.value"):
                    #print("7\n")
                    continue
                if is_dependent(
                    ir.call_value,
                    SolidityVariableComposed("msg.value"),
                    func.contract,
                ):
                    #print("8\n")
                    continue

                if is_tainted(ir.destination, func.contract):
                    #print("9\n")
                    ret.append(node)

    return ret


def detect_arbitrary_send(contract: Contract):
    """
        Detect arbitrary send
    Args:
        contract (Contract)
    Returns:
        list((Function), (list (Node)))
    """
    ret = []
    for f in [f for f in contract.functions if f.contract_declarer == contract]:
        nodes = arbitrary_send(f)
        if nodes:
            ret.append((f, nodes))
    return ret


class ArbitraryEthSent(AbstractDetector):
    ARGUMENT = "arbitrary-eth-sent"
    HELP = "Functions that send Ether to arbitrary destinations"
    IMPACT = DetectorClassification.HIGH
    CONFIDENCE = DetectorClassification.MEDIUM

    WIKI = "https://github.com/crytic/slither/wiki/Detector-Documentation#functions-that-send-ether-to-arbitrary-destinations"

    WIKI_TITLE = "Functions that send Ether to arbitrary destinations"
    WIKI_DESCRIPTION = "Unprotected call to a function sending Ether to an arbitrary address."

    # region wiki_exploit_scenario
    WIKI_EXPLOIT_SCENARIO = """
```solidity
contract ArbitrarySendEth{
    address destination;
    function setDestination(){
        destination = msg.sender;
    }

    function withdraw() public{
        destination.transfer(this.balance);
    }
}
```
Bob calls `setDestination` and `withdraw`. As a result he withdraws the contract's balance."""
    # endregion wiki_exploit_scenario

    WIKI_RECOMMENDATION = "Ensure that an arbitrary user cannot withdraw unauthorized funds."

    def _detect(self) -> List[Output]:
        """"""
        results = []
        plugins = set()
        target_line = ''

        for c in self.contracts:
            arbitrary_send_result = detect_arbitrary_send(c)
            for (func, nodes) in arbitrary_send_result:

                info = [func, "sends eth to arbitrary user\n"]
                info += ["\tArbitrary-Sending-eth calls:\n"]

                # sort the nodes to get deterministic results
                nodes.sort(key=lambda x: x.node_id)

                for node in nodes:
                    #TODO
                    spot = ("Arbitrary-Sending-eth ", str(node.source_mapping.filename.absolute) + " ",
                                str(node.source_mapping.lines[0]) + " ", str(func.contract))
                    plugins.add(spot)
                    target_line = str(node.source_mapping.lines[0])

                    info += ["\t- ", node, "\n"]

                res = self.generate_result(info)

                results.append(res)

        if plugins:

            target_offset = ''
            print("target_line",target_line)

            with open(file="srcmap.txt", mode="r", encoding="utf-8") as f:
                lines = f.read().split('\n')
                i = -1
                j = i
                for line in lines:
                    i += 1
                    if 'Source line ' + target_line + ':' in line:
                        j = i + 2
                target_offset = str(int(lines[j].strip().split(':')[0], 16))


            with open(file="srcmap.txt", mode="a", encoding="utf-8") as f:
                for plugin in plugins:
                    f.writelines(plugin)
                    f.write("\n")
                    f.writelines("target_offset: " + target_offset)
                    f.write("\n")


        return results
