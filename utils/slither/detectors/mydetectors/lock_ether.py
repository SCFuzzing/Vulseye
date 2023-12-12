from slither.detectors.abstract_detector import AbstractDetector, DetectorClassification
from slither.slithir.operations.high_level_call import HighLevelCall
from slither.slithir.operations.low_level_call import LowLevelCall
from slither.slithir.operations.send import Send
from slither.slithir.operations.transfer import Transfer
from slither.slithir.operations.new_contract import NewContract
from slither.slithir.operations.library_call import LibraryCall
from slither.slithir.operations.internal_call import InternalCall

class LockEther(AbstractDetector):

    ARGUMENT = "lock-ether"
    HELP = ""
    IMPACT = DetectorClassification.SELF
    CONFIDENCE = DetectorClassification.SELF

    WIKI = "self-made"
    WIKI_TITLE = ""
    WIKI_DESCRIPTION = ""
    WIKI_EXPLOIT_SCENARIO = ""
    WIKI_RECOMMENDATION = ""

    def do_not_send_ether(self, contract):
        functions = contract.all_functions_called
        to_explore = functions
        explored = []
        while to_explore:
            functions = to_explore
            explored += to_explore
            to_explore = []
            for function in functions:
                calls = [call.name for call in function.internal_calls]
                if "suicide(address)" in calls or "selfdestruct(address)" in calls:
                    return False
                for node in function.nodes:
                    for ir in node.irs:
                        if isinstance(
                            ir,
                            (Send, Transfer, HighLevelCall, LowLevelCall, NewContract),
                        ):
                            if ir.call_value and ir.call_value != 0:
                                return False
                        #仅依靠delegatecall来实现ether转出，具有资金锁定的风险
                        # if isinstance(ir, (LowLevelCall)):
                        #     if ir.function_name == "delegatecall":
                        #         return False

                        if isinstance(ir, (InternalCall, LibraryCall)):
                            if not ir.function in explored:
                                to_explore.append(ir.function)
        return True

    def _detect(self):
        results = []
        plugins = set()
        target_line = ''

        for contract in self.compilation_unit.contracts_derived:
            if contract.is_signature_only():
                continue
            funcs_payable = [function for function in contract.functions if function.payable]
            if funcs_payable:
                if self.do_not_send_ether(contract):
                    info = ["Lock Ether in ", contract, ":\n"]
                    info += ["Cannot withdraw ether but includes payable functions below:\n"]

                    for function in funcs_payable:
                        spot = ("Lock-Ether ", str(function.source_mapping.filename.absolute) + " ",
                                str(function.source_mapping.lines[0] + 1) + " ", str(function.contract))
                        plugins.add(spot)
                        target_line = str(function.source_mapping.lines[0] + 1)
                        info += ["\t- ", function, "\n"]

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
                    if 'Source line ' + target_line + ':'  in line:
                        j = i + 2
                target_offset = str(int(lines[j].strip().split(':')[0], 16))


            with open(file="srcmap.txt", mode="a", encoding="utf-8") as f:
                for plugin in plugins:
                    f.writelines(plugin)
                    f.write("\n")
                    f.writelines("target_offset: " + target_offset)
                    f.write("\n")

        return results
