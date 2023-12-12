import solcx
import sys
import re

file_name = sys.argv[1]
output_dir = sys.argv[2]
with open(file_name,'r')as f:
        lines = f.readlines()
        for line in lines:
            if 'pragma solidity' in line:
                pattern = r'\b\d+\.\d+\.\d+\b'
                if re.findall(pattern, line):
                    solc_version = re.findall(pattern, line)[0]
                else:
                    solc_version = '0.8.0'
                
#print('=========================contract solidity version:',solc_version)

# if solc_version.startswith('0.8'):
#     version = int(solc_version.split('.')[2])
#     if version > 9:
#         print(f'contract solidity version:{solc_version} > 0.8.9, has been set to 0.8.9')
#         solc_version = '0.8.9'

installed_versions = []
for item in solcx.get_installed_solc_versions():
    #print("installed_solc_versions:", item)
    installed_versions.append(str(item))
if not solc_version in installed_versions:
    #print("installing:",solc_version)
    solcx.install_solc(solc_version)
solcx.set_solc_version(solc_version, True)
#print('=========================solcx_version:',solcx.get_solc_version())

output = solcx.compile_files([file_name])
for key in output:
    ctc_fuc_key = key


#print("output:",output)

out_filename = ctc_fuc_key.split(':')[1] + '.bin-runtime'
out_bin_runtime = output[ctc_fuc_key]['bin-runtime']
with open(output_dir + '/' + out_filename,'w')as f:
    f.write(out_bin_runtime)
# print(ctc_fuc_key.split(':')[1])
# print(output[ctc_fuc_key]['bin-runtime'])
print(solc_version)