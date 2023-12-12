from slither.detectors.abstract_detector import AbstractDetector, DetectorClassification
from slither.slithir.operations.low_level_call import LowLevelCall
from slither.analyses.data_dependency.data_dependency import is_tainted_remastered,is_tainted

class DangerousDelegateCall(AbstractDetector):

    ARGUMENT = "controlled-delegatecall"
    HELP = ""
    IMPACT = DetectorClassification.SELF
    CONFIDENCE = DetectorClassification.SELF

    WIKI = "self-made"
    WIKI_TITLE = ""
    WIKI_DESCRIPTION = ""
    WIKI_EXPLOIT_SCENARIO = ""
    WIKI_RECOMMENDATION = ""

    def _detect(self):
        results = []
        plugins = set()
        target_line = ''

        for contract in self.compilation_unit.contracts_derived:
            for function in contract.functions:
                # ignore upgradeable proxies and protected functions
                if contract.is_upgradeable_proxy and function.is_protected():
                    continue
                result = []
                info = []

                for node in function.nodes:
                    for ir in node.irs:
                        if isinstance(ir, LowLevelCall):
                            if ir.function_name in ["delegatecall","callcode"]: 
                                if is_tainted_remastered(ir.destination, function.contract):
                                    result.append(node)

                if result:
                    info += ["Controlled delegatecall in ", function, ":\n"]

                    info += ["Delegatecall was controlled by input:\n"]
                    for node in result:
                        spot = ("Controlled-Dele ", str(node.source_mapping.filename.absolute) + " ",
                                str(node.source_mapping.lines[0]) + " ", str(function.contract))
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
            print("target_line", target_line)

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
