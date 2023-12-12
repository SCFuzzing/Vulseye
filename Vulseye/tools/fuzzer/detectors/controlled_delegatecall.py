#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from z3 import is_expr
from utils import settings

class ControlledDelegatecallDetector():
    def __init__(self):
        self.init()

    def init(self):
        self.swc_id = 112
        self.severity = "High"
        self.delegatecall = None

    def detect_controlled_delegatecall(self, current_instruction, tainted_record, individual, previous_instruction, transaction_index):
        if current_instruction["op"] == "DELEGATECALL":
            #TODO
            #tainted_record.stack[-2] delegatecall-address is tainted(from CALLER CALLDATALOAD)
            if tainted_record and tainted_record.stack[-2] and is_expr(tainted_record.stack[-2][0]):
                #print(tainted_record)
                # print("tainted_record.stack[-2]",tainted_record.stack[-2],"\n")
                if "calldataload" in str(tainted_record.stack[-2][0]):
                    #sender is the attacker_accounts
                    for index in range(len(individual.solution)):
                        if individual.solution[index]["transaction"]["from"] not in settings.ATTACKER_ACCOUNTS:
                            return None, None
                    self.delegatecall = current_instruction["pc"], transaction_index
        elif current_instruction["op"] == "STOP" and self.delegatecall:
            return self.delegatecall
        return None, None
