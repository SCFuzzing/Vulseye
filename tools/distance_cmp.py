generation = -1
code_distance = {}
state_distance = {}
code = []
state = []

with open('distance_tmp.txt')as f:
    lines = f.read().split('\n')
    lines = lines[0:-1]
    last_seed = 0
    for line in lines:
        #print(line)
        seed = int(line.split()[1])
        #print('seed',seed)
        item = line.split()[2]
        score = float(line.split()[3])
        
        if seed == 0 and item == 'code':
            generation += 1
            code_distance[generation] = 0
            state_distance[generation] = 0
            seed_amount = last_seed + 1
        else:
            last_seed = seed
        if item == 'code':
            code_distance[generation] += score
        if item == 'state':
            state_distance[generation] += score

# print("seed_amount: ", seed_amount)




for item in code_distance:
    score_mean = round(code_distance[item]/seed_amount, 2)
    code.append(score_mean)

for item in state_distance:
    score_mean = round(state_distance[item]/seed_amount)
    state.append(score_mean)


with open('distance.txt','a')as f:
    msg = f'code distance:\n {code}\nstate distance:\n {state}\n'
    f.write(msg)

# print('code distance: ', code)
# print('state distance: ', state)
