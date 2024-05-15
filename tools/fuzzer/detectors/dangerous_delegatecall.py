# -*- coding: utf-8 -*-

from z3 import is_expr
from utils import settings
from utils.utils import convert_stack_value_to_hex, convert_stack_value_to_int, is_fixed
from engine.analysis import SymbolicTaintAnalyzer

class DangerousDelegatecallDetector():
    def __init__(self):
        self.init()

    def init(self):
        self.swc_id = 112
        self.severity = "High"
        self.delegatecall = None

    def detect_dangerous_delegatecall(self, current_instruction, tainted_record, individual, previous_instruction, transaction_index):
        if current_instruction["op"] == "DELEGATECALL":
            #TODO
            #offset = convert_stack_value_to_int(instruction["stack"][-(mutator[0] + 1)])
            #size = convert_stack_value_to_int(instruction["stack"][-(mutator[1] + 1)])
            #taint = SymbolicTaintAnalyzer.extract_taint_from_memory(records[-2].memory, offset, size)
            offset = convert_stack_value_to_int(current_instruction["stack"][-3])
            size = convert_stack_value_to_int(current_instruction["stack"][-4])
            taint = SymbolicTaintAnalyzer.extract_taint_from_memory(tainted_record.memory, offset, size)
            #print("taint:",str(taint),"\n\n")
            if taint:
                if "calldataload" in str(taint):
                    #sender is the attacker_accounts
                    for index in range(len(individual.solution)):
                        if individual.solution[index]["transaction"]["from"] not in settings.ATTACKER_ACCOUNTS:
                            return None, None
                    self.delegatecall = current_instruction["pc"], transaction_index
        elif current_instruction["op"] == "STOP" and self.delegatecall:
            return self.delegatecall
        return None, None