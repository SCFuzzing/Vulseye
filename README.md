## Vulseye

**It is a vulnerability-directed graybox fuzzer designed for smart contracts.**



<img src="utils/images/Vulseye.jpeg" alt="Vulseye"  />



### Requirements

1. #### Solidity Compiler

   To avoid switching the `solc` version manually and causing unnecessary compilation errors, our tool automatically determines the solidity version of contracts and uses `py-solc-x` for compilation. We have done some work to fix minor bugs in the `py-solc-x` package and made it compatible with our tool.

   ```shell
   pip3 install py-solc-x
   pip3 install crytic_compile
   #replace the fixed solcx package with the package in your local path
   cp -r utils/solcx your-python-path/site-packages/solcx
   #replace the fixed crytic_compile package with the package in your local path
   cp -r utils/crytic_compile your-python-path/site-packages/crytic_compile
   ```

2. #### Slither

   We have made minor modifications to Slither to better adapt to our tools.

   ```shell
   pip3 install slither-analyzer
   #replace the modified crytic_compile package with the package in your local path
   cp -r utils/slither your-python-path/site-packages/slither_analyzer-0.x.x-py3.x.egg/slither
   ```

3. #### Z3 Prover

   Download the source code of z3 and install.

   ```shell
   python scripts/mk_make.py --python
   cd build
   make
   make install
   ```

### Running demos

```shell
cd Vulseye/tools
./main.sh demo/reentrancy.sol
#the default fuzz generation is 80
```

The overall results are recorded in `Vulseye/tools/res.txt`. 

The source_map is recorded in `Vulseye/tools/srcmap.txt`.

The information of code targets and block distance is recorded in `Vulseye/tools/CodeDistance.txt`.

The information of state targets is recorded in `Vulseye/tools/StateDistance.txt`.

Other running informations are recorded in `Vulseye/tools/distance.txt` and `Vulseye/tools/coverage.txt`.



**The completed version of Vulseye will be released soon!**
