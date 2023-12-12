"""
Module detecting suicidal contract

A suicidal contract is an unprotected function that calls selfdestruct
"""

from slither.detectors.abstract_detector import AbstractDetector, DetectorClassification
from slither.slithir.operations.internal_call import InternalCall
from slither.slithir.operations import (
    LowLevelCall,
    HighLevelCall,
    Transfer,
    Send,
    SolidityCall,
)
from slither.core.declarations import SolidityFunction, Function


class SuicidalContract(AbstractDetector):
    """
    Unprotected function detector
    """

    ARGUMENT = "suicidal-contract"
    HELP = "Functions allowing anyone to destruct the contract"
    IMPACT = DetectorClassification.HIGH
    CONFIDENCE = DetectorClassification.HIGH

    WIKI = "https://github.com/crytic/slither/wiki/Detector-Documentation#suicidal"

    WIKI_TITLE = "Suicidal"
    WIKI_DESCRIPTION = "Unprotected call to a function executing `selfdestruct`/`suicide`."

    # region wiki_exploit_scenario
    WIKI_EXPLOIT_SCENARIO = """
```solidity
contract Suicidal{
    function kill() public{
        selfdestruct(msg.sender);
    }
}
```
Bob calls `kill` and destructs the contract."""
    # endregion wiki_exploit_scenario

    WIKI_RECOMMENDATION = "Protect access to all sensitive functions."

    @staticmethod
    def detect_suicidal_func(func):
        """Detect if the function is suicidal

        Detect the public functions calling suicide/selfdestruct without protection
        Returns:
            (bool): True if the function is suicidal
        """
        plugins = set()

        target_line = ''

        if func.is_constructor:
            return False

        if func.visibility not in ["public", "external"]:
            return False
        #TODO
        calls = [c.name for c in func.internal_calls]
        if not ("suicide(address)" in calls or "selfdestruct(address)" in calls):
            return False

        #TODO
        # if func.is_protected():
        #     return False
        suicide_instructions = [c for c in func.internal_calls if c.name in ["suicide(address)","selfdestruct(address)"] ]
        #print(suicide_instructions)

        
        #TODO
        for node in func.nodes:
            for ir in node.irs:
                if isinstance(ir, SolidityCall) and ir.function in [
                    SolidityFunction("suicide(address)"),
                    SolidityFunction("selfdestruct(address)"),
                ]:

                    spot = ("Suicidal-Contract ", str(node.source_mapping.filename.absolute) + " ",
                            str(node.source_mapping.lines[0]) + " ", str(func.contract))
                    plugins.add(spot)

                    target_line = str(node.source_mapping.lines[0])
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


        
        return True

    def detect_suicidal(self, contract):
        ret = []
        for f in contract.functions_declared:
            if self.detect_suicidal_func(f):
                ret.append(f)
        return ret

    def _detect(self):
        """Detect the suicidal functions"""
        results = []
        for c in self.contracts:
            functions = self.detect_suicidal(c)
            for func in functions:

                info = [func, " allows anyone to destruct the contract\n"]

                res = self.generate_result(info)

                results.append(res)

        return results
