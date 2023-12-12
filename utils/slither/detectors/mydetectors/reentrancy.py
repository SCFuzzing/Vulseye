from collections import namedtuple, defaultdict

from slither.detectors.abstract_detector import DetectorClassification
from slither.detectors.reentrancy.reentrancy import Reentrancy, to_hashable

FindingKey = namedtuple("FindingKey", ["function", "calls"])
FindingValue = namedtuple("FindingValue", ["variable", "node", "writenodes"])


class ReentrancyNew(Reentrancy):
    ARGUMENT = "reentrancy"
    HELP = ""
    IMPACT = DetectorClassification.SELF
    CONFIDENCE = DetectorClassification.SELF

    WIKI = "self-made"
    WIKI_TITLE = ""
    WIKI_DESCRIPTION = ""
    WIKI_EXPLOIT_SCENARIO = ""
    WIKI_RECOMMENDATION = ""

    STANDARD_JSON = False

    def find_reentrancies(self):
        result = defaultdict(set)
        for contract in self.contracts:
            for function in contract.functions_and_modifiers_declared:
                for node in function.nodes:
                    if not self.KEY in node.context:
                        continue

                    # for every node, check if its father contains calls
                    if node.context[self.KEY].calls:
                        # if so, check if there are variables written
                        read_then_written = set()
                        for c in node.context[self.KEY].calls:
                            # v for the state variable read and written, node for the current node
                            # nodes for the ones ever write to those variables
                            if c == node:
                                continue
                            read_then_written |= {
                                FindingValue(v, node, tuple(sorted(writenodes, key=lambda x: x.node_id)))
                                for (v, writenodes) in node.context[self.KEY].written.items()
                                if v in node.context[self.KEY].reads_prior_calls[c]
                            }

                        if read_then_written:
                            finding_key = FindingKey(node.function, to_hashable(node.context[self.KEY].calls))

                            result[finding_key] |= set(read_then_written)
        return result

    def _detect(self):

        super()._detect()
        reentrancies = self.find_reentrancies()

        results = []

        plugins = set()
        target_line = ''

        result_sorted = sorted(list(reentrancies.items()), key=lambda x: x[0].function.name)
        for (func, calls), varsUsed in result_sorted:
            calls = sorted(list(set(calls)), key=lambda x: x[0].node_id)
            varsUsed = sorted(varsUsed, key=lambda x: (x.variable.name, x.node.node_id))

            info = ["Reentrancy in ", func, ":\n"]

            info += ["\tExternal calls:\n"]
            for (call_info, calls_list) in calls:
                info += ["\t- ", call_info, "\n"]
                for call_list_info in calls_list:
                    spot = ("Reentrancy ", str(call_list_info.source_mapping.filename.absolute) + " ",
                            str(call_list_info.source_mapping.lines[0]) + " ", str(func.contract))
                    plugins.add(spot)
                    target_line = str(call_list_info.source_mapping.lines[0])
                    if call_list_info != call_info:
                        info += ["\t\t- ", call_list_info, "\n"]
            info += "\tState variables written after the call(s):\n"
            for finding_value in varsUsed:
                info += ["\t- ", finding_value.node, "\n"]
                for other_node in finding_value.writenodes:
                    if other_node != finding_value.node:
                        info += ["\t\t- ", other_node, "\n"]

            res = self.generate_result(info)
            results.append(res)

        # if plugins:

        #     with open(file = "plug-in.txt", mode = "a", encoding = "utf-8") as f:
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
