import pulp as pl
import sys
from table import *
from global_data import *
from instructions import *

pl.LpSolverDefault.msg = 0


def redirection(loc, old_pc):
    # print('redirecting pc= ',old_pc)
    op = opcode[loc].split(": ")[1]
    if op.startswith("PUSH"):
        op = op.split(' ')[0]
    if op not in redirection_table.keys():
        op = 'INVALID'
    new_pcs = []
    for turple in redirection_table[op]:
        if turple[0] == old_pc:
            new_pcs.append(turple[1])

    print("redirect op: %s (%i) pc= %s" % (op, loc, str(new_pcs)))

    stack.pop(loc, new_pcs)

    if new_pcs == []:
        print("End Backwording: ", op)
    else:
        for pc in new_pcs:
            if pc == 0:
                print("End Backwording: ", op)
            else:
                backwards_slicing(loc, pc)


def backwards_slicing(loc, pc):
    print("backwarding: %s (%i)(%s) pc= %i" % (opcode[loc].split(": ")[1], loc, opcode[loc - 1].split(": ")[1], pc))

    op = opcode[loc - 1].split(": ")[1]

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


#    return new_loc, res

def main(request):
    # res = backwards_slicing(opcde, , 2)
    i = 0
    j = 0
    for op_num in opcode:
        op = op_num.split(": ")[1]
        j += 1
        if op == 'JUMPI':
            i += 1
        if i == request:
            break
    # backwards_slicing(opcode, j-1 , 2)
    print()
    print("Backwards:")
    redirection(j - 1, 1)
    print()
    print("Constrain:")
    for item in constrains:
        print("%s = %s(%s)" % (str(item.left), str(item.op), str(item.right)))

    for i, item in enumerate(constrains):
        # 创建左侧的符号变量
        if item.left not in var_dic.keys():
            var_dic[item.left] = pl.LpVariable("%s" % str(item.left))
            # 添加一个初始约束 jumpi 2 == 0
            if i == 0:
                Pulp_cons.push(var_dic[item.left] == 0)
                # #添加一个初始约束 jumpi 2 != 0
                # new_pulp_cons_1 = Pulp_cons.clone()
                # new_pulp_cons_1.push(var_dic[item.left] >= 1)
                # Pulp_cons.push(var_dic[item.left] <= -1)
                # #约束分支合并
                # Pulp_cons.merge(new_pulp_cons_1)

        # 创建右侧的符号变量，如果操作为eq则没有右侧的变量需要创建
        if item.op != 'eq':
            for var in item.right:
                if var not in var_dic.keys():
                    var_dic[var] = pl.LpVariable("%s" % str(var))

        # 进行op操作生成pulp约束cons
        if item.op in op_dic.keys():
            op_dic[item.op](item)

    print()
    print("var_dic:")
    print(var_dic)
    print()
    print("cons:")
    pulp_constrains = Pulp_cons.get_constraints()
    for i, cons in enumerate(pulp_constrains):
        print("cons:%i" % i, cons)

    print()
    print("target_var:")
    print(target_var)

    print()
    print("ranges: (target_func, i-th constrain, range)")
    for tar in target_var:
        ranges = get_Range(tar)
        print(ranges)


def get_Range(target_func):
    ranges = []
    # 计算最大值
    pulp_constrains = Pulp_cons.get_constraints()
    for i, cons in enumerate(pulp_constrains):
        max = get_Max(cons, target_func)
        min = get_Min(cons, target_func)

        if max == None and min == None:
            ranges.append((target_func, i, None))
        elif max == None:
            ranges.append((target_func, i, (min, float('inf'))))
        elif min == None:
            ranges.append((target_func, i, (float('-inf'), max)))
        elif max == min:
            ranges.append((target_func, i, (max, max)))
        else:
            ranges.append((target_func, i, (min, max)))
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


if __name__ == "__main__":
    main(int(sys.argv[1]))
