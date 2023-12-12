#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time

from utils.utils import print_individual_solution_as_transaction, initialize_logger

from .integer_overflow import IntegerOverflowDetector
from .assertion_failure import AssertionFailureDetector
from .arbitrary_memory_access import ArbitraryMemoryAccessDetector
from .reentrancy import ReentrancyDetector
from .transaction_order_dependency import TransactionOrderDependencyDetector
from .block_dependency import BlockDependencyDetector
from .unchecked_return_value import UncheckedReturnValueDetector
from .controlled_delegatecall import ControlledDelegatecallDetector
#TODO
from .dangerous_delegatecall import DangerousDelegatecallDetector
from .leaking_ether import LeakingEtherDetector
from .locking_ether import LockingEtherDetector
from .unprotected_selfdestruct import UnprotectedSelfdestructDetector

from datetime import datetime


def print_res(file_name, line, vul_name, env):
    with open('res.txt', 'r')as f:
        date_format = "%Y-%m-%d %H:%M:%S.%f"
        i = -2
        lines = f.read().split('\n')
        content = lines[i]
        print(f"content {content} i {i}")
        while 'start fuzzing' not in content:
            i = i - 3
            content = lines[i]
            print(f"content {content} i {i}")
        _start_time = content.split(' ')[0] + ' ' + content.split(' ')[1]
        start_time = datetime.strptime(_start_time, date_format)


    with open('res.txt', 'a')as f:
        _code_coverage = round((len(env.code_coverage) / len(env.overall_pcs)) * 100,2)
        branch_coverage = 0
        for pc in env.visited_branches:
            branch_coverage += len(env.visited_branches[pc])
        branch_coverage_percentage = 0
        if len(env.overall_jumpis) > 0:
            branch_coverage_percentage = round((branch_coverage / (len(env.overall_jumpis) * 2)) * 100,2)



        end_time = datetime.now()
        f.write(str(end_time))
        f.write(f'      {vul_name} has been detected in line:{line} of {file_name}\n')
        f.write(f'code coverage:{_code_coverage}%     branch coverage: {branch_coverage_percentage}%\n')

        #f.write(f'_start_time: {_start_time}')
        f.write(f'detecting takes: {end_time - start_time}\n')
        #f.write('\n===================================================\n')
    


class DetectorExecutor:
    def __init__(self, source_map=None, function_signature_mapping={}):
        self.source_map = source_map
        self.function_signature_mapping = function_signature_mapping
        self.logger = initialize_logger("Detector")

        self.integer_overflow_detector = IntegerOverflowDetector()
        self.assertion_failure_detector = AssertionFailureDetector()
        self.arbitrary_memory_access_detector = ArbitraryMemoryAccessDetector()
        self.reentrancy_detector = ReentrancyDetector()
        self.transaction_order_dependency_detector = TransactionOrderDependencyDetector()
        self.block_dependency_detector = BlockDependencyDetector()
        self.unchecked_return_value_detector = UncheckedReturnValueDetector()
        self.controlled_delegatecall_detector = ControlledDelegatecallDetector()
        self.leaking_ether_detector = LeakingEtherDetector()
        self.locking_ether_detector = LockingEtherDetector()
        self.unprotected_selfdestruct_detector = UnprotectedSelfdestructDetector()
        #TODO
        self.dangerous_delegatecall_detector = DangerousDelegatecallDetector()

    def initialize_detectors(self):
        self.integer_overflow_detector.init()
        self.assertion_failure_detector.init()
        self.arbitrary_memory_access_detector.init()
        self.reentrancy_detector.init()
        self.transaction_order_dependency_detector.init()
        self.block_dependency_detector.init()
        self.unchecked_return_value_detector.init()
        self.controlled_delegatecall_detector.init()
        self.leaking_ether_detector.init()
        #TODO
        #每次individual的执行不重新初始化locking_ether_detector
        #self.locking_ether_detector.init()
        self.unprotected_selfdestruct_detector.init()
        #TODO
        self.dangerous_delegatecall_detector.init()

    @staticmethod
    def error_exists(errors, type):
        for error in errors:
            if error["type"] == type:
                return True
        return False

    @staticmethod
    def add_error(errors, pc, type, individual, mfe, detector, source_map):
        error = {
            "swc_id": detector.swc_id,
            "severity": detector.severity,
            "type": type,
            "individual": individual.solution,
            "time": time.time() - mfe.execution_begin,

        }
        if source_map and source_map.get_buggy_line(pc):
            error["line"] = source_map.get_location(pc)['begin']['line'] + 1
            error["column"] = source_map.get_location(pc)['begin']['column'] + 1
            error["source_code"] = source_map.get_buggy_line(pc)
        if not pc in errors:
            errors[pc] = [error]
            return True
        elif not DetectorExecutor.error_exists(errors[pc], type):
            errors[pc].append(error)
            return True
        return False

    def get_color_for_severity(severity):
        if severity == "High":
            return "\u001b[31m" # Red
        if severity == "Medium":
            return "\u001b[33m" # Yellow
        if severity == "Low":
            return "\u001b[32m" # Green
        return ""

    def run_detectors(self, previous_instruction, current_instruction, errors, tainted_record, individual, mfe, previous_branch, transaction_index):
        pc, index = self.arbitrary_memory_access_detector.detect_arbitrary_memory_access(tainted_record, individual, current_instruction, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Arbitrary Memory Access", individual, mfe, self.arbitrary_memory_access_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.arbitrary_memory_access_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"      !!! Arbitrary memory access detected !!!       ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.arbitrary_memory_access_detector.swc_id))
            self.logger.title(color+"Severity: "+self.arbitrary_memory_access_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Arbitrary memory access', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.assertion_failure_detector.detect_assertion_failure(current_instruction, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Assertion Failure", individual, mfe, self.assertion_failure_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.assertion_failure_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"          !!! Assertion failure detected !!!         ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.assertion_failure_detector.swc_id))
            self.logger.title(color+"Severity: "+self.assertion_failure_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Assertion failure', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index, type = self.integer_overflow_detector.detect_integer_overflow(mfe, tainted_record, previous_instruction, current_instruction, individual, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Integer Overflow", individual, mfe, self.integer_overflow_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.integer_overflow_detector.severity)
            if type == "overflow":
                self.logger.title(color+"-----------------------------------------------------")
                self.logger.title(color+"          !!! Integer overflow detected !!!          ")
                self.logger.title(color+"-----------------------------------------------------")
            else:
                self.logger.title(color+"-----------------------------------------------------")
                self.logger.title(color+"          !!! Integer underflow detected !!!          ")
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.integer_overflow_detector.swc_id))
            self.logger.title(color+"Severity: "+self.integer_overflow_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Integer overflow / underflow', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.reentrancy_detector.detect_reentrancy(tainted_record, current_instruction, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Reentrancy", individual, mfe, self.reentrancy_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.reentrancy_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"            !!! Reentrancy detected !!!              ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.reentrancy_detector.swc_id))
            self.logger.title(color+"Severity: "+self.reentrancy_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Reentrancy', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.transaction_order_dependency_detector.detect_transaction_order_dependency(current_instruction, tainted_record, individual, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Transaction Order Dependency", individual, mfe, self.transaction_order_dependency_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.transaction_order_dependency_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"    !!! Transaction order dependency detected !!!    ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.transaction_order_dependency_detector.swc_id))
            self.logger.title(color+"Severity: "+self.transaction_order_dependency_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Transaction order dependency', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.block_dependency_detector.detect_block_dependency(tainted_record, current_instruction, previous_branch, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Block Dependency", individual, mfe, self.block_dependency_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.block_dependency_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"          !!! Block dependency detected !!!          ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.block_dependency_detector.swc_id))
            self.logger.title(color+"Severity: "+self.block_dependency_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Timestamp-Dependency / BlockNumber-Dependency', mfe)

            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.unchecked_return_value_detector.detect_unchecked_return_value(previous_instruction, current_instruction, tainted_record, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Unchecked Return Value", individual, mfe, self.unchecked_return_value_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.unchecked_return_value_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"        !!! Unchecked return value detected !!!         ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.unchecked_return_value_detector.swc_id))
            self.logger.title(color+"Severity: "+self.unchecked_return_value_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Unchecked return value', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.controlled_delegatecall_detector.detect_controlled_delegatecall(current_instruction, tainted_record, individual, previous_instruction, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Controlled Delegatecall", individual, mfe, self.controlled_delegatecall_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.controlled_delegatecall_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"        !!! Controlled delegatecall detected !!!         ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.controlled_delegatecall_detector.swc_id))
            self.logger.title(color+"Severity: "+self.controlled_delegatecall_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Controlled-Delegatecall', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)


        #TODO
        #detect_dangerous_delegatecall
        pc, index = self.dangerous_delegatecall_detector.detect_dangerous_delegatecall(current_instruction, tainted_record, individual, previous_instruction, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Dangerous Delegatecall", individual, mfe, self.dangerous_delegatecall_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.dangerous_delegatecall_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"        !!! Dangerous delegatecall detected !!!         ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.dangerous_delegatecall_detector.swc_id))
            self.logger.title(color+"Severity: "+self.dangerous_delegatecall_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Dangerous-Delegatecall', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)


        pc, index = self.leaking_ether_detector.detect_leaking_ether(current_instruction, tainted_record, individual, transaction_index, previous_branch)
        if pc and DetectorExecutor.add_error(errors, pc, "Leaking Ether", individual, mfe, self.leaking_ether_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.leaking_ether_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"           !!! Leaking ether detected !!!            ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.leaking_ether_detector.swc_id))
            self.logger.title(color+"Severity: "+self.leaking_ether_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            #self.logger.title(color+"Transaction sequence:"+str(len(mfe.code_coverage)))

            print_res(str(self.source_map.source.filename),str(line), 'Arbitrary-Send-Ether', mfe)

            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.locking_ether_detector.detect_locking_ether(mfe.cfg, current_instruction, individual, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Locking Ether", individual, mfe, self.locking_ether_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.locking_ether_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"           !!! Locking ether detected !!!!            ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.locking_ether_detector.swc_id))
            self.logger.title(color+"Severity: "+self.locking_ether_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)

        pc, index = self.unprotected_selfdestruct_detector.detect_unprotected_selfdestruct(current_instruction, tainted_record, individual, transaction_index)
        if pc and DetectorExecutor.add_error(errors, pc, "Unprotected Selfdestruct", individual, mfe, self.unprotected_selfdestruct_detector, self.source_map):
            color = DetectorExecutor.get_color_for_severity(self.unprotected_selfdestruct_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"      !!! Unprotected selfdestruct detected !!!      ")
            self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"SWC-ID:   "+str(self.unprotected_selfdestruct_detector.swc_id))
            self.logger.title(color+"Severity: "+self.unprotected_selfdestruct_detector.severity)
            self.logger.title(color+"-----------------------------------------------------")
            if self.source_map and self.source_map.get_buggy_line(pc):
                self.logger.title(color+"Source code line:")
                self.logger.title(color+"-----------------------------------------------------")
                line = self.source_map.get_location(pc)['begin']['line'] + 1
                column = self.source_map.get_location(pc)['begin']['column'] + 1
                self.logger.title(color+self.source_map.source.filename+":"+str(line)+":"+str(column))
                self.logger.title(color+self.source_map.get_buggy_line(pc))
                self.logger.title(color+"-----------------------------------------------------")
            self.logger.title(color+"Transaction sequence:")
            self.logger.title(color+"-----------------------------------------------------")
            print_res(str(self.source_map.source.filename),str(line), 'Suicidal', mfe)
            print_individual_solution_as_transaction(self.logger, individual.solution, color, self.function_signature_mapping, index)
