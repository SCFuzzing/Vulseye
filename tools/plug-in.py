import sys
import os
import stat
from telnetlib import PRAGMA_HEARTBEAT


solidity_version = sys.argv[2]
if sys.argv[1] != "prepare":

    with open(file="plug-in.txt", mode="r", encoding="utf-8") as f1:
        target = f1.readlines()[int(sys.argv[1]) - 1]
    #print("file:",target.split(" ")[1])

    print("target",target.split(" ")[2])

    with open(file=target.split(" ")[1], mode="r") as fread:
        with open(file=target.split(" ")[1] + "new", mode="w") as f2:
            count = 0
            for line in fread.readlines():
                if count == int(target.split(" ")[2]) - 1:
                #if count == int(target.split(" ")[2]):
                    f2.writelines("assembly {\n\tinvalid()\n}\n")
                f2.writelines(line)
                count += 1

    # with open(file=target.split(" ")[1], mode="r") as fread:
    #     with open(file=target.split(" ")[1] + "new", mode="w") as f2:
    #         count = 0
    #         for line in fread.readlines():
    #             if count == int(target.split(" ")[2]) - 1:
    #             #if count == int(target.split(" ")[2]):
    #                 f2.writelines("assembly {\n\tpush32 0x12345\n\tpop}\n")
    #             f2.writelines(line)
    #             count += 1




    os.remove(target.split(" ")[1])
    os.rename(target.split(" ")[1] + "new", target.split(" ")[1])
    os.chmod(target.split(" ")[1], stat.S_IRWXU|stat.S_IRWXG|stat.S_IRWXO)

else:
    interesting_contracts = set()

    with open(file="srcmap.txt", mode="r", encoding="utf-8") as f3:
        plugin = f3.readlines()[-2]
        interesting_contracts.add(plugin.split(" ")[-1])

    if len(interesting_contracts) == 1:
        contract = interesting_contracts.pop().strip("\n")
        with open(file="before_json.sh", mode="w", encoding="utf-8") as f4:
            f4.write(f"java -jar EtherSolve.jar -r -j -o before.json ./$1\"_temp/compiled/{contract}.bin-runtime\"")

        # with open(file="after_json.sh", mode="w", encoding="utf-8") as f5:
        #     f5.write(f"java -jar EtherSolve.jar -r -j -o \"./after/after\"$cmd_count\".json\" ./$1\"_temp/compiled_after/{contract}.bin-runtime\"")

        # for i in range(len(plugins)):
        #     with open(file=f"./cmds/plug-in_{i + 1}.sh", mode="w", encoding="utf-8") as f6:
        #         f6.write(f"python3 plug-in.py {i + 1} {solidity_version}")

        with open(file="fuzz.sh", mode="w", encoding="utf-8") as f7:
            f7.write(f"python3 fuzzer/main.py -s $1 -c {contract} --solc {solidity_version} --evm byzantium -g 80")

    else:
        for j in range(100):
            print("Vulnerabilities in multiple contracts!")



