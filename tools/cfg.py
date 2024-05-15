import json
import os
import sys
import math
import networkx as nx
import pulp as pl
from table import *


class Constrain:
    def __init__(self, left, right, op):
        self.left = left
        self.right = right
        self.op = op


class ConstrainStack:
    def __init__(self):
        self.items = []

    def is_empty(self):
        return self.items == []

    # 变量用元组(loc, pc)表示（操作位置、pc）
    # 表达式用Constrain(left, right, op)类表示，left right为变量，op为操作
    def push(self, loc, pc):
        self.items.append((loc, pc))

    def pop(self, loc, new_pcs):
        right = []
        if not self.is_empty():
            left = self.items.pop()
            if new_pcs[0] == 0:
                # left是一个元组 right是可以得出数值的操作码str(e.g. PUSH 0x0, ADDRESS)，op是eq代表left的值已知
                constrain = Constrain(left, opcodes[loc].split(": ")[1], 'eq')
                constrains.append(constrain)
            else:
                for pc in reversed(new_pcs):
                    self.push(loc, pc)
                for pc in new_pcs:
                    right.append((loc, pc))
                # left是一个元组 right是元组列表，op是操作码（e.g. SUB）
                constrain = Constrain(left, right, opcodes[loc].split(": ")[1])
                constrains.append(constrain)
        else:
            self.push(loc, new_pcs[0])


class pulp_cons:
    def __init__(self):
        # 约束数组[约束1[]，约束2[]...]
        self.cons = []

    def new_con(self):
        self.cons.append([])

    def push(self, constrain):
        # 每一个数组里的元素都添加相应的约束
        for it in self.cons:
            it.append(constrain)

    def clone(self):
        # 复制当前对象的约束数组并返回一个新的pulp_cons对象
        new_pulp_cons = pulp_cons()
        new_pulp_cons.cons = [c[:] for c in self.cons]
        return new_pulp_cons

    def merge(self, new_pulp_cons):
        self.cons += new_pulp_cons.cons

    def get_constraints(self):
        return self.cons



def check_jump(jump_dic):
    checked_jump = {}
    for slot1 in jump_dic:
        if 'Storage' in slot1:
            _slot1 = slot1.replace("Storage", "").replace('range','slot')
            for slot2 in jump_dic:
                if _slot1 == slot2:
                    checked_jump[slot1] = jump_dic[slot1]
                    checked_jump[slot2] = jump_dic[slot2]
    return checked_jump


def redirection(loc, old_pc):
    # print('redirecting pc= ',old_pc)
    op = opcodes[loc].split(": ")[1]
    if op.startswith("PUSH"):
        op = op.split(' ')[0]
    if op not in redirection_table.keys():
        op = 'INVALID'
    new_pcs = []
    for _tuple in redirection_table[op]:
        if _tuple[0] == old_pc:
            new_pcs.append(_tuple[1])

    # print("redirect op: %s (%i) pc= %s" % (op, loc, str(new_pcs)))

    stack.pop(loc, new_pcs)

    if not new_pcs:
        pass
        # print("End Backwarding: ", op)
    else:
        for pc in new_pcs:
            if pc == 0:
                pass
                # print("End Backwarding: ", op)
            else:
                backwards_slicing(loc, pc)


def backwards_slicing(loc, pc):
    # print("backwarding: %s (%i)(%s) pc= %i" % (opcodes[loc].split(": ")[1], loc, opcodes[loc - 1].split(": ")[1], pc))

    op = opcodes[loc - 1].split(": ")[1]

    if op.startswith("PUSH"):
        op = op.split(' ')[0]
    if op not in backwards_table.keys():
        op = 'INVALID'
    A = backwards_table[op][0]
    B = backwards_table[op][1]
    if pc > B:
        backwards_slicing(loc - 1, pc - B + A)
    #       new_loc, res = backwards_slicing(opcde, loc-1, pc-B+A)

    else:
        new_loc = loc - 1
        redirection(new_loc, pc)


def get_Range(target_func, _jump_dic):
    ranges = []
    # 计算最大值
    pulp_constrains = Pulp_cons.get_constraints()
    for con_num, cons in enumerate(pulp_constrains):
        max_bound = get_Max(cons, target_func)
        min_bound = get_Min(cons, target_func)
        _range = ()

        if max_bound is None and min_bound is None:
            _range = (target_func, con_num, None)
        elif max_bound is None:
            _range = (target_func, con_num, (min_bound, float('inf')))
        elif min_bound is None:
            _range = (target_func, con_num, (float('-inf'), max_bound))
        elif max_bound == min_bound:
            _range = (target_func, con_num, (max_bound, max_bound))
        else:
            _range = (target_func, con_num, (min_bound, max_bound))
        ranges.append(_range)

        if _range[2]:
            if str(target_func).startswith("Storage"):
                _jump_dic[f"constrain_{target_func}_{con_num}_range"] = _range[2]
            else:
                _jump_dic[f"constrain_{target_func}_{con_num}_slot"] = int(_range[2][0])
                if _range[2][0] != _range[2][1]:
                    print("Warning! Unexpected Slot Value!")
    return ranges


def get_Max(cons, target_func):
    # 添加目标函数
    prob = pl.LpProblem("problem", pl.LpMaximize)
    prob += target_func
    # 添加约束
    for con in cons:
        prob += con
    # 解决线性规划
    status = prob.solve()

    if status == 1:
        return prob.objective.value()
    else:
        return None


def get_Min(cons, target_func):
    # 添加目标函数
    prob = pl.LpProblem("problem", pl.LpMinimize)
    prob += target_func
    # 添加约束
    for con in cons:
        prob += con
    # 解决线性规划
    status = prob.solve()

    if status == 1:
        return prob.objective.value()
    else:
        return None

    # print()
    # print("%s最小值"%str(target_func), prob.objective.value())
    # print("status: ", status, pl.LpStatus)


# eq
# PUSH ADDRESS ORIGIN.....(_,0)
def eq(Constrain):
    # cons: left = right
    if Constrain.right.startswith('PUSH'):

        value = Constrain.right.split('0x')[1]
        # 以FFFFFF开头默认为有符号整数
        # in Byzantium fork, use lowercase instead
        if value.startswith('FFFFFF') or value.startswith('ffffff'):
            num_bits = len(value) * 4  # 计算整数的位数
            value = int(value, 16)  # 将 字符串转换为整数
            value -= (1 << num_bits)  # 将它转换为有符号整数

        # 否则默认为无符号整数
        else:
            value = int(Constrain.right.split(' ')[1], 16)
        Pulp_cons.push(var_dic[Constrain.left] == value)


# 0s: Stop and Arithmetic Operations
def STOP(Constrain):
    pass


def ADD(Constrain):
    # cons: left = right0 + right1
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]] + var_dic[Constrain.right[1]])


def MUL(Constrain):
    pass


def SUB(Constrain):
    # cons: left = right0 - right1
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]])
    # return var_dic[Constrain.left] == var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]]


def DIV(Constrain):
    pass


def SDIV(Constrain):
    pass


def MOD(Constrain):
    pass


def SMOD(Constrain):
    pass


def MULMOD(Constrain):
    pass


def EXP(Constrain):
    pass


def SIGNEXTEND(Constrain):
    pass


# 10s: Comparison & Bitwise Logic Operations
def LT(Constrain):
    # 创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    # cons: left = 1, right0 - right1 < 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)
    # cons: left = 0, right0 - right1 >= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 0)
    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def SLT(Constrain):
    # 创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    # cons: left = 1, right0 - right1 < 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)
    # cons: left = 0, right0 - right1 >= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 0)
    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def GT(Constrain):
    # 创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    # cons: left = 1, right0 - right1 > 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    # cons: left = 0, right0 - right1 <= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= 0)
    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def SGT(Constrain):
    # 创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    # cons: left = 1, right0 - right1 > 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    # cons: left = 0, right0 - right1 <= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= 0)
    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def EQ(Constrain):
    # 创建新的约束分支
    new_pulp_cons_1 = Pulp_cons.clone()
    new_pulp_cons_2 = Pulp_cons.clone()
    # cons: left = 1, right0 - right1 == 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] == 0)
    # cons: left = 0, right0 - right1 > 0
    new_pulp_cons_1.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_1.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    # cons: left = 0, right0 - right1 < 0
    new_pulp_cons_2.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_2.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)

    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons_1)
    Pulp_cons.merge(new_pulp_cons_2)


def ISZERO(Constrain):
    # 创建新的约束分支
    new_pulp_cons_1 = Pulp_cons.clone()
    new_pulp_cons_2 = Pulp_cons.clone()
    # cons: left = 1, right0 == 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] == 0)
    # cons: left = 0, right0 > 0
    new_pulp_cons_1.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_1.push(var_dic[Constrain.right[0]] >= 1)
    # cons: left = 0, right0 < 0
    new_pulp_cons_2.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_2.push(var_dic[Constrain.right[0]] <= -1)
    # 约束分支合并
    Pulp_cons.merge(new_pulp_cons_1)
    Pulp_cons.merge(new_pulp_cons_2)


def AND(Constrain):
    pass


def OR(Constrain):
    pass


def XOR(Constrain):
    pass


def NOT(Constrain):
    pass


def BYTE(Constrain):
    pass


# 20s: SHA3

def SHA3(Constrain):
    pass


# 30s: Environmental Information

# eq
def ADDRESS(Constrain):
    pass


# eq
def BALANCE(Constrain):
    pass


# eq
def ORIGIN(Constrain):
    pass


# eq
def CALLER(Constrain):
    pass


# eq
def CALLVALUE(Constrain):
    pass


def CALLDATALOAD(Constrain):
    pass


# eq
def CALLDATASIZE(Constrain):
    pass


def CALLDATACOPY(Constrain):
    pass


# eq
def CODESIZE(Constrain):
    pass


def CODECOPY(Constrain):
    pass


# eq
def GASPRICE(Constrain):
    pass


def EXTCODESIZE(Constrain):
    pass


def EXTCODECOPY(Constrain):
    pass


# eq
def RETURNDATASIZE(Constrain):
    pass


def RETURNDATACOPY(Constrain):
    pass


# 40s: Block Information
# eq

# other
def BLOCKHASH(Constrain):
    pass


# 50s: Stack, Memory, Storage and Flow Operations
def SLOAD(Constrain):
    # 创建一个新的变量Storage(right)
    var = 'Storage%s' % str(Constrain.right[0])
    if var not in var_dic.keys():
        var_dic[var] = pl.LpVariable("%s" % str(var))

    # 将Storage(right)和right加入pulp目标函数中

    if not any(v.name == '%s' % var_dic[var].name for v in target_var):
        target_var.append(var_dic[var])

    if not any(v.name == '%s' % var_dic[Constrain.right[0]].name for v in target_var):
        target_var.append(var_dic[Constrain.right[0]])

    # cons: left = Storage(right0)
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[var])


# 60s & 70s: Push Operations
# eq

# 80s: Duplication Operations
def DUP(Constrain):
    # cons: left = right0
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]])


# 90s: Exchange Operations
def SWAP(Constrain):
    # cons: left = right0
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]])


# a0s: Logging Operations

# f0s: System operations

def interval_intersection(interval1, interval2):
    interval1.sort()
    interval2.sort()
    result = []

    i = j = 0

    while i < len(interval1) and j < len(interval2):
        a, b = interval1[i]
        x, y = interval2[j]

        inter = intersection(a, b, x, y)

        if inter is not None:
            result.append(inter)

        if b < y:
            i += 1
        else:
            j += 1

    return result


def intersection(a, b, x, y):
    if a > b:
        a, b = b, a
    if x > y:
        x, y = y, x

    if b < x or a > y:
        return None
    else:
        left = max(a, x)
        right = min(b, y)
        return left, right


# 字典op_dic存储操作码生成puple约束
op_dic = {
    'eq': eq,
    'ADD': ADD,
    'SUB': SUB,
    'LT': LT,
    'SLT': SLT,
    'GT': GT,
    'SGT': SGT,
    'EQ': EQ,
    'ISZERO': ISZERO,
    'SLOAD': SLOAD,
    'DUP1': DUP,
    'DUP2': DUP,
    'DUP3': DUP,
    'DUP4': DUP,
    'DUP5': DUP,
    'DUP6': DUP,
    'DUP7': DUP,
    'DUP8': DUP,
    'DUP9': DUP,
    'DUP10': DUP,
    'DUP11': DUP,
    'DUP12': DUP,
    'DUP13': DUP,
    'DUP14': DUP,
    'DUP15': DUP,
    'DUP16': DUP,
    'SWAP1': SWAP,
    'SWAP2': SWAP,
    'SWAP3': SWAP,
    'SWAP4': SWAP,
    'SWAP5': SWAP,
    'SWAP6': SWAP,
    'SWAP7': SWAP,
    'SWAP8': SWAP,
    'SWAP9': SWAP,
    'SWAP10': SWAP,
    'SWAP11': SWAP,
    'SWAP12': SWAP,
    'SWAP13': SWAP,
    'SWAP14': SWAP,
    'SWAP15': SWAP,
    'SWAP16': SWAP

}

# contains x dicts, x equals the number of target nodes
# each dict contains y dicts, y equals the number of basic blocks
target_distances = {}
target_offset = ''

with open(file="srcmap.txt", mode="r", encoding="utf-8") as f:
    plugin = f.readlines()[-1].strip('\n')
    target_offset = plugin.split(" ")[-1]
    print("target_offset:", target_offset)


# for plugged_json in os.listdir("./after"):
#     with open(file="./after/" + plugged_json, mode="r", encoding="utf-8") as f1:
#         f1load = json.load(f1)

#     for node in f1load["runtimeCfg"]["nodes"]:
#         if node["parsedOpcodes"].find("INVALID") != -1:
#             target_distances[node["offset"]] = {}
#             break
    

# print(f1load["runtimeCfg"]["nodes"])

with open(file="before.json", mode="r", encoding="utf-8") as f2:
    f2load = json.load(f2)
    for node in f2load["runtimeCfg"]["nodes"]:
        if node["parsedOpcodes"].find(target_offset + ':') != -1:
            target_distances[node["offset"]] = {}
            break


# print("================================")


# print(f2load["runtimeCfg"]["nodes"])


cfg = nx.DiGraph()

for edges in f2load["runtimeCfg"]["successors"]:
    for to in edges["to"]:
        cfg.add_edge(edges["from"], to)



for target in target_distances:
    print("target_node:",target)
    # print("cfg:",cfg)


    for node in cfg.nodes:
        # print("node:",node)
        target_distances[target][node] = 114514

        try:
            target_distances[target][node] = nx.shortest_path_length(cfg, node, target)

        except nx.exception.NetworkXNoPath:
            pass
        
        

print("target_distances:",target_distances)


BasicBlockDistance = {}
for node in cfg.nodes:
    # precede_target indicates how many target nodes this node is in front of
    BasicBlockDistance[node] = {"distance": 0, "precede_target": 0}
    # basic block is a target block
    if node in target_distances:
        BasicBlockDistance[node]["precede_target"] = -1
        continue

    for target in target_distances:
        # basic block follows a target block
        if nx.has_path(cfg, target, node):
            BasicBlockDistance[node] = {"distance": 0.001, "precede_target": -1}
            break

        # normal basic block
        else:
            # if this node cannot reach a target block, don't count it
            if target_distances[target][node] != 114514:
                BasicBlockDistance[node]["distance"] += 1 / target_distances[target][node]
                BasicBlockDistance[node]["precede_target"] += 1




for node, Distance in BasicBlockDistance.items():
    if Distance["precede_target"] == -1:
        continue
    if Distance["precede_target"]:
        Distance["distance"] = round(Distance["precede_target"] / Distance["distance"], 3)
    else:
        Distance["distance"] = math.inf

with open(file="CodeDistance.json", mode="w", encoding="utf-8") as f3:
    json.dump(BasicBlockDistance, f3)

target_dic = {}
for target in target_distances:
    target_dic[target] = []
    for path_index, path in enumerate(nx.all_simple_paths(cfg, 0, target)):
        print('path_index:', path_index)
    for path_index, path in enumerate(nx.all_simple_paths(cfg, 0, target)):

        # if path_index != 2:
        #     continue
        print("================================================")
        print("path_index", path_index)
        print("Path:", path)
        
        raw_opcodes = ""
        for path_node in path:
            for node in f2load["runtimeCfg"]["nodes"]:
                if node["offset"] == path_node:
                    raw_opcodes += node["parsedOpcodes"] + "\n"

        opcodes = raw_opcodes.strip("\n").split("\n")

        raw_path_dic = {}
        jump = 0
        # print()
        # print("opcode:", opcodes)
        # print()
        for opcode_index, raw_opcode in enumerate(opcodes):
            opcode_offset = int(raw_opcode.split(": ")[0])
            opcode = raw_opcode.split(": ")[1]
            if opcode == 'JUMPI' and opcode_index != len(opcodes) - 1:
                jump += 1

                pl.LpSolverDefault.msg = 0

                stack = ConstrainStack()
                constrains = []
                var_dic = {}
                target_var = []
                Pulp_cons = pulp_cons()
                Pulp_cons.new_con()

                # backwards_slicing(opcode, j-1 , 2)
                # print()
                # print("Backwards:")
                redirection(opcode_index, 1)
                # print("redirection:", raw_opcode)
                # print()
                # print("Constrain:")
                # for item in constrains:
                #     print("%s = %s(%s)" % (str(item.left), str(item.op), str(item.right)))

                for i, item in enumerate(constrains):
                    # 创建左侧的符号变量
                    if item.left not in var_dic.keys():
                        var_dic[item.left] = pl.LpVariable("%s" % str(item.left))

                        if i == 0:
                            if int(opcodes[opcode_index + 1].split(": ")[0]) == opcode_offset + 1:
                                # 添加一个初始约束 jumpi 2 == 0
                                Pulp_cons.push(var_dic[item.left] == 0)
                            else:
                                # 添加一个初始约束 jumpi 2 != 0
                                new_pulp_cons_1 = Pulp_cons.clone()
                                new_pulp_cons_1.push(var_dic[item.left] >= 1)
                                Pulp_cons.push(var_dic[item.left] <= -1)
                                # 约束分支合并
                                Pulp_cons.merge(new_pulp_cons_1)

                    # 创建右侧的符号变量，如果操作为eq则没有右侧的变量需要创建
                    if item.op != 'eq':
                        for var in item.right:
                            if var not in var_dic.keys():
                                var_dic[var] = pl.LpVariable("%s" % str(var))

                    # 进行op操作生成pulp约束cons
                    if item.op in op_dic.keys():
                        op_dic[item.op](item)

                # print()
                # print("var_dic:")
                # print(var_dic)
                # print()
                # print("cons:")
                pulp_constrains = Pulp_cons.get_constraints()
                # for i, cons in enumerate(pulp_constrains):
                #     print("cons:%i" % i, cons)

                # print()
                # print("target_var:")
                # print(target_var)
                
                # print("target_var:", target_var)
                
                if target_var:
                    print("------------------------------------------------")
                    print("target_var:", target_var)
                    # print(jump)
                    # print()
                    # print("ranges: (target_func, i-th constrain, range)")

                    jump_dic = {}
                    for tar in target_var:
                        print("tar:", tar)
                        ranges = get_Range(tar, jump_dic)
                        # print()
                        # print("ranges", ranges)
                        real_ranges = [real_range for real_range in ranges if real_range[2]]
                        print("real_ranges", real_ranges)

                        # for item in constrains:
                        #     print("%s = %s(%s)" % (str(item.left), str(item.op), str(item.right)))
                    # print()
                    # print("jump_dic:", jump_dic)
                    jump_dic = check_jump(jump_dic)
                    # print()
                    print("target_var_ranges:", jump_dic)
                    print()

                    raw_path_dic[f"JUMPI_{jump}"] = jump_dic

        # print("raw_path_dic", raw_path_dic["JUMPI_7"])
        path_dic = {}
        for jumpi in raw_path_dic:
            jumpi_path_dic = {}
            for slot in raw_path_dic[jumpi]:
                print("slot:",slot)
                print("raw_path_dic[jumpi][slot]",raw_path_dic[jumpi][slot])
                if slot.endswith("slot"):
                    if path_dic.get(raw_path_dic[jumpi][slot]) is None:
                        path_dic[raw_path_dic[jumpi][slot]] = [(-math.inf,math.inf)]
                    if jumpi_path_dic.get(raw_path_dic[jumpi][slot]) is None:
                        jumpi_path_dic[raw_path_dic[jumpi][slot]] = []
                        #print("[raw_path_dic[jumpi][slot]]:",raw_path_dic[jumpi][slot])
                    print("raw_path_dic[jumpi][slot]:",raw_path_dic[jumpi][slot])
                    jumpi_path_dic[raw_path_dic[jumpi][slot]].append(raw_path_dic[jumpi][slot.replace("slot", "range").replace('n_','n_Storage')])
                    #print(jumpi_path_dic[raw_path_dic[jumpi][slot]])
            for slot in jumpi_path_dic:
                
                # print()
                # print("path_dic[slot]",path_dic[slot])
                # print("jumpi_path_dic[slot]",jumpi_path_dic[slot])
                # print()

                # if not path_dic[slot]:
                #     path_dic[slot] = jumpi_path_dic[slot]
                # else:
                #     path_dic[slot] = interval_intersection(path_dic[slot], jumpi_path_dic[slot])
                path_dic[slot] = interval_intersection(path_dic[slot], jumpi_path_dic[slot])
                print("path_dic[slot]", path_dic[slot])


            # print(jumpi_path_dic)
        # print(path_dic)
        if path_dic:
            repeated = False
            empty = False
            for dic in target_dic[target]:
                for slot in path_dic:
                    if not path_dic[slot]:
                        empty = True
                        break
                    if sorted(path_dic[slot]) == sorted(dic.get(slot, [])):
                        repeated = True
                        break
                if repeated:
                    break
            if not repeated and not empty:
                target_dic[target].append(path_dic)

print('###############################################################')
print("target_state:",target_dic)
print('###############################################################')

with open(file="StateDistance.json", mode="w", encoding="utf-8") as f4:
    json.dump(target_dic, f4)





    

