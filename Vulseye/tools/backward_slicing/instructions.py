from global_data import *
import pulp as pl


#eq
# PUSH ADDRESS ORIGIN.....(_,0)
def eq(Constrain):
    #cons: left = right
    if Constrain.right.startswith('PUSH'):

        value = Constrain.right.split('0x')[1]
        #以FFFFFF开头默认为有符号整数
        if value.startswith('FFFFFF'):
            num_bits = len(value) * 4  # 计算整数的位数
            value = int(value, 16)  # 将 字符串转换为整数
            value -= (1 << num_bits)  # 将它转换为有符号整数
    
        #否则默认为无符号整数
        else:
            value = int(Constrain.right.split(' ')[1], 16)
        Pulp_cons.push(var_dic[Constrain.left] == value)


#0s: Stop and Arithmetic Operations
def STOP(Constrain):
    pass

def ADD(Constrain):
    #cons: left = right0 + right1
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]] + var_dic[Constrain.right[1]])



def MUL(Constrain):
    pass


def SUB(Constrain):
    #cons: left = right0 - right1
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

#10s: Comparison & Bitwise Logic Operations
def LT(Constrain):
    #创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    #cons: left = 1, right0 - right1 < 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)
    #cons: left = 0, right0 - right1 >= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 0)
    #约束分支合并
    Pulp_cons.merge(new_pulp_cons)



def SLT(Constrain):
    #创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    #cons: left = 1, right0 - right1 < 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)
    #cons: left = 0, right0 - right1 >= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 0)
    #约束分支合并
    Pulp_cons.merge(new_pulp_cons)

def GT(Constrain):
    #创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    #cons: left = 1, right0 - right1 > 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    #cons: left = 0, right0 - right1 <= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= 0)
    #约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def SGT(Constrain):
    #创建新的约束分支
    new_pulp_cons = Pulp_cons.clone()
    #cons: left = 1, right0 - right1 > 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    #cons: left = 0, right0 - right1 <= 0
    new_pulp_cons.push(var_dic[Constrain.left] == 0)
    new_pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= 0)
    #约束分支合并
    Pulp_cons.merge(new_pulp_cons)


def EQ(Constrain):
    #创建新的约束分支
    new_pulp_cons_1 = Pulp_cons.clone()
    new_pulp_cons_2 = Pulp_cons.clone()
    #cons: left = 1, right0 - right1 == 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] == 0)
    #cons: left = 0, right0 - right1 > 0
    new_pulp_cons_1.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_1.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] >= 1)
    #cons: left = 0, right0 - right1 < 0
    new_pulp_cons_2.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_2.push(var_dic[Constrain.right[0]] - var_dic[Constrain.right[1]] <= -1)

    #约束分支合并
    Pulp_cons.merge(new_pulp_cons_1)
    Pulp_cons.merge(new_pulp_cons_2)

def ISZERO(Constrain):
    #创建新的约束分支
    new_pulp_cons_1 = Pulp_cons.clone()
    new_pulp_cons_2 = Pulp_cons.clone()
    #cons: left = 1, right0 == 0
    Pulp_cons.push(var_dic[Constrain.left] == 1)
    Pulp_cons.push(var_dic[Constrain.right[0]] == 0)
    #cons: left = 0, right0 > 0
    new_pulp_cons_1.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_1.push(var_dic[Constrain.right[0]] >= 1)
    #cons: left = 0, right0 < 0
    new_pulp_cons_2.push(var_dic[Constrain.left] == 0)
    new_pulp_cons_2.push(var_dic[Constrain.right[0]] <= -1)
    #约束分支合并
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

#20s: SHA3

def SHA3(Constrain):
    pass


#30s: Environmental Information

#eq
def ADDRESS(Constrain):
    pass
#eq
def BALANCE(Constrain):
    pass
#eq
def ORIGIN(Constrain):
    pass
#eq
def CALLER(Constrain):
    pass
#eq
def CALLVALUE(Constrain):
    pass

def CALLDATALOAD(Constrain):
    pass
#eq
def CALLDATASIZE(Constrain):
    pass

def CALLDATACOPY(Constrain):
    pass
#eq
def CODESIZE(Constrain):
    pass

def CODECOPY(Constrain):
    pass
#eq
def GASPRICE(Constrain):
    pass

def EXTCODESIZE(Constrain):
    pass


def EXTCODECOPY(Constrain):
    pass
#eq
def RETURNDATASIZE(Constrain):
    pass

def RETURNDATACOPY(Constrain):
    pass


#40s: Block Information
#eq

#other
def BLOCKHASH(Constrain):
    pass


#50s: Stack, Memory, Storage and Flow Operations
def SLOAD(Constrain):

    #创建一个新的变量Storage(right)
    var = 'Storage%s'%str(Constrain.right[0])
    if var not in var_dic.keys():
        var_dic[var] = pl.LpVariable("%s"%str(var))

    #将Storage(right)和right加入pulp目标函数中

    if not any(v.name == '%s'%var_dic[var].name for v in target_var):
        target_var.append(var_dic[var])
    
    if not any(v.name == '%s'%var_dic[Constrain.right[0]].name for v in target_var):
        target_var.append(var_dic[Constrain.right[0]])

    #cons: left = Storage(right0)
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[var])



#60s & 70s: Push Operations
#eq

#80s: Duplication Operations
def DUP(Constrain):
    #cons: left = right0
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]])

#90s: Exchange Operations
def SWAP(Constrain):
    #cons: left = right0
    Pulp_cons.push(var_dic[Constrain.left] == var_dic[Constrain.right[0]])


#a0s: Logging Operations

#f0s: System operations



#字典op_dic存储操作码生成puple约束
op_dic = {
    'eq':eq,
    'ADD':ADD,
    'SUB':SUB,
    'LT':LT,
    'SLT':SLT,
    'GT':GT,
    'SGT':SGT,
    'EQ':EQ,
    'ISZERO':ISZERO,
    'SLOAD':SLOAD,
    'DUP1':DUP,
    'DUP2':DUP,
    'DUP3':DUP,
    'DUP4':DUP,
    'DUP5':DUP,
    'DUP6':DUP,
    'DUP7':DUP,
    'DUP8':DUP,
    'DUP9':DUP,
    'DUP10':DUP,
    'DUP11':DUP,
    'DUP12':DUP,
    'DUP13':DUP,
    'DUP14':DUP,
    'DUP15':DUP,
    'DUP16':DUP,
    'SWAP1':SWAP,
    'SWAP2':SWAP,
    'SWAP3':SWAP,
    'SWAP4':SWAP,
    'SWAP5':SWAP,
    'SWAP6':SWAP,
    'SWAP7':SWAP,
    'SWAP8':SWAP,
    'SWAP9':SWAP,
    'SWAP10':SWAP,
    'SWAP11':SWAP,
    'SWAP12':SWAP,
    'SWAP13':SWAP,
    'SWAP14':SWAP,
    'SWAP15':SWAP,
    'SWAP16':SWAP

}