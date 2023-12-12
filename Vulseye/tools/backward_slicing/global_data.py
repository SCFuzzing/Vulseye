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

#变量用元组(loc, pc)表示（操作位置、pc）
#表达式用Constrain(left, right, op)类表示，left right为变量，op为操作
    def push(self, loc, pc):
        self.items.append((loc, pc))

    def pop(self, loc, new_pcs):
        right = []
        if not self.is_empty():
            left = self.items.pop()
            if new_pcs[0] == 0:
                #left是一个元组 right是可以得出数值的操作码str(e.g. PUSH 0x0, ADDRESS)，op是eq代表left的值已知
                constrain = Constrain(left, opcode[loc].split(": ")[1], 'eq')
                constrains.append(constrain)
            else:
                for pc in reversed(new_pcs):
                    self.push(loc, pc)
                for pc in new_pcs:
                    right.append((loc, pc))
                #left是一个元组 right是元组列表，op是操作码（e.g. SUB）
                constrain = Constrain(left, right, opcode[loc].split(": ")[1])
                constrains.append(constrain)
        else:
            self.push(loc, new_pcs[0])



def read_opcode(file):
    with open(file, 'r') as f:
        opcode = f.read().strip("\\n\"").split("\\n")

        # TODO: changed the read_opcode method
        # instructions = f.read().strip().split()
        # op = ""
        # for instruction in instructions:
        #     if op != "":
        #         op = op + ' ' + instruction
        #     else:
        #         op = instruction
        #     if instruction.startswith("PUSH"):
        #         continue
        #     else:
        #         opcode.append(op)
        #         op = ""
    return opcode


class pulp_cons:
    def __init__(self):
        #约束数组[约束1[]，约束2[]...]
        self.cons = []
    
    def new_con(self):
        self.cons.append([])

    def push(self, constrain):
        #每一个数组里的元素都添加相应的约束
        for i in self.cons:
            i.append(constrain)
    
    def clone(self):
        # 复制当前对象的约束数组并返回一个新的pulp_cons对象
        new_pulp_cons = pulp_cons()
        new_pulp_cons.cons = [c[:] for c in self.cons]
        return new_pulp_cons
    
    def merge(self, new_pulp_cons):
        self.cons += new_pulp_cons.cons
    
    def get_constraints(self):
        return self.cons


file_name = 'test/test4.json_opcodes_1.txt'
# file_name = "test/bin_1.txt"

stack = ConstrainStack()
# opcode file with PUSHes connected to values
opcode = read_opcode(file_name)

#通过反向切片进行栈操作得到的约束表达式
# 类型为class Constrain (e.g. (106, 2) = SUB([(104, 1), (104, 2)]))
constrains = []

#字典var_dic存储puple字符变量
#元组:pl.LpVariable(e.g. (104, 2): (104,_2)) 或者字符串:pl.LpVariable (e.g. 'Storage(103, 1)': Storage(103,_1))
var_dic = {}

#target_var存储puple目标函数,pl.LpVariable
target_var = []



#列表存储转化后的pulp约束(e.g. 1*(104,_1) + 1*(104,_2) + 1*(106,_2) + 0 = 0)
Pulp_cons = pulp_cons()
Pulp_cons.new_con()