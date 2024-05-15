#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from utils.utils import convert_stack_value_to_int




class LockingEtherDetector():
    def __init__(self):
        self.init()

    def init(self):
        self.swc_id = 132
        self.severity = "Medium"
        #TODO
        #具有全局可见性，每一次execution_function都会初始化
        #对于locking_ether不进行初始化
        self.can_send = False
        self.can_recv = False
        #print("init!!!!\n\n\n\n")

    def detect_locking_ether(self, cfg, current_instruction, individual, transaction_index):
        # Check if we cannot send ether
        #TODO
        #current_instruction["stack"][-1] in ["SELFDESTRUCT", "SUICIDE"]
        if current_instruction["op"] in ["SELFDESTRUCT", "SUICIDE"]:
            self.can_send = True

        if current_instruction["op"] =="CREATE" and convert_stack_value_to_int(current_instruction["stack"][-1]) > 0:
            #cfg.can_send_ether = True
            self.can_send = True
        if current_instruction["op"] =="CALL" and convert_stack_value_to_int(current_instruction["stack"][-3]) > 0:
            #cfg.can_send_ether = True
            self.can_send = True

        # if not cfg.can_send_ether:
        #     # Check if we can receive ether
        #     if current_instruction["op"] == "STOP" and individual.solution[transaction_index]["transaction"]["value"] > 0:
        #         return current_instruction["pc"], transaction_index

        if current_instruction["op"] == "STOP" and individual.solution[transaction_index]["transaction"]["value"] > 0:
            #print("can recv ether\n\n\n\n\n")
            self.can_recv = True


        return None, None
