from slither.analyses.data_dependency.data_dependency import is_dependent
from slither.core.declarations.solidity_variables import (
    SolidityVariableComposed,
    SolidityVariable,
    SolidityFunction
)
from slither.detectors.abstract_detector import AbstractDetector, DetectorClassification
from slither.slithir.operations.high_level_call import HighLevelCall
from slither.slithir.operations.low_level_call import LowLevelCall
from slither.slithir.operations.send import Send
from slither.slithir.operations.transfer import Transfer
from slither.core.declarations import Function
from typing import List
from slither.core.cfg.node import Node
from slither.slithir.operations import Binary, BinaryType

# from slither import Slither
# import sys
# sys.path.append("/home/lrc/anaconda3/lib/python3.9/site-packages/slither_analyzer-0.9.2-py3.9.egg/slither")
# import printers.summary.evm


def _blocknumber(func: Function) -> List[Node]:
    ret = set()
    for node in func.nodes:
        if node.contains_require_or_assert():
            for var in node.variables_read:
                # if is_dependent(var, SolidityVariableComposed("block.blockhash"), func.contract):
                #     ret.add(node)
                if is_dependent(var, SolidityVariableComposed("block.number"), func.contract):
                    ret.add(node)
        for ir in node.irs:
            if isinstance(ir, Binary) and BinaryType.return_bool(ir.type):
                for var in ir.read:
                    # if is_dependent(
                    #     var, SolidityVariableComposed("block.blockhash"), func.contract
                    # ):
                    #     ret.add(node)
                    if is_dependent(var, SolidityVariableComposed("block.number"), func.contract):
                        ret.add(node)
    return sorted(list(ret), key=lambda x: x.node_id)





class BlockNumber(AbstractDetector):

    ARGUMENT = "blocknumber-dependency"
    HELP = ""
    IMPACT = DetectorClassification.SELF
    CONFIDENCE = DetectorClassification.SELF

    WIKI = "self-made"

    WIKI_TITLE = ""
    WIKI_DESCRIPTION = ""
    WIKI_EXPLOIT_SCENARIO = ""
    WIKI_RECOMMENDATION = ""

    def _detect(self):
        result = []
        info = []
        results = []
        plugins = set()
        target_line = ''

        for contract in self.compilation_unit.contracts_derived:
            for function in contract.functions:
                func = []
                for node in function.nodes:
                    for ir in node.irs:
                        if isinstance(ir, (Send, Transfer, HighLevelCall, LowLevelCall)):
                            if ir.call_value and ir.call_value != 0:
                                nodes = _blocknumber(function)
                                if nodes: 
                                    func.append(node)
                        if isinstance(ir, (LowLevelCall)):
                            if ir.function_name == "delegatecall":
                                nodes = _blocknumber(function)
                                if nodes: 
                                    func.append(node)


                if func:
                    result.append(func)

        if result:
            for function in result:
                info += ["BlockNumber dependency in ", function[0].function, ":\n"]
                info += ["BlockNumber involved in call(s):\n"]
                for node in function:

                    # evm_info = printers.summary.evm._extract_evm_info(Slither)
                    # contract_pcs = evm_info["mapping", contract.name]
                    # print()
                    # print("node:", contract_pcs.get(node.source_mapping, []))
                    # print()
                    
                    spot = ("BlockNumber ", str(node.source_mapping.filename.absolute) + " ",
                                str(node.source_mapping.lines[0]) + " ", str(node.function.contract))
                    plugins.add(spot)
                    target_line = str(node.source_mapping.lines[0])
                    info += ["\t- ", node, "\n"]

        if info:
            res = self.generate_result(info)
            results.append(res)

        # if plugins:
        #     with open(file="plug-in.txt", mode="a", encoding="utf-8") as f:
        #         for plugin in plugins:
        #             f.writelines(plugin)
        #             f.write("\n")


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