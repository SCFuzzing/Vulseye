#! /bin/bash
file_path=$1

mkdir $file_path"_temp"
mkdir $file_path"_temp/compiled"
# mkdir $file_path"_temp/compiled_after"

file_name=$(basename "$file_path")

#cp $file_path $file_path"_temp"/$file_name


solidity_version=`python3 compile.py $file_path $file_path"_temp/compiled"`

slither $file_path --print evm > srcmap.txt 2>&1

slither $file_path --detect arbitrary-eth-sent,blocknumber-dependency,controlled-delegatecall,dangerous-delegatecall,lock-ether,reentrancy,suicidal-contract,timestamp-dependency

#mkdir cmds
timeout 600s python3 plug-in.py prepare $solidity_version

. ./before_json.sh

. ./fuzz.sh


python3 distance_cmp.py

#. ./rm.sh $file_path
. ./rm.sh