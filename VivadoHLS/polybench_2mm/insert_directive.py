# Definition: You need to enter a tree digit number as an argument.                   
#	      First, second and third digits represent first,second and third         
#             directive locatio respectively. Each digit can taje values from 0 to 5.
#             0 -> No directive
#             1 -> Loop unrolling
#             2 -> Loop pipelining
#             3 -> Array partitioning
#             4 -> Func. Inlining
#             5 -> Allocation
#####################################################################################


import sys

param = sys.argv[1]

search_string1 = '//directive1'
search_string2 = '//directive2'
search_string3 = '//directive3'

directive = [ "#pragma HLS unroll","#pragma HLS pipeline","#pragma HLS arrar_partition", "#pragma HLS inline","#pragma HLS allocation",""] 

file_content = open("2mm_default.c",'r+')
lines = []
flag = 0
for line in file_content:
    #line = line.lower()
    stripped_line = line
    if search_string1 in line:
        flag = 1
        index1 = int(int(param)/100) - 1	
        stripped_line = line.strip('\n') + "\n" + directive[index1] + "\n"   
    if search_string2 in line:
        flag = 1
        index2 = int((int(param)%100)/10) - 1
        stripped_line = line.strip('\n') + "\n" + directive[index2] + "\n"   
    if search_string3 in line:
        flag = 1
        index3 = int((int(param)%100)%10) - 1
        stripped_line = line.strip('\n') + "\n" + directive[index3] + "\n"  
    lines.append(stripped_line)
file_content.close()
if(flag == 1):
    file_content = open("2mm.c",'w')
    file_content.writelines(lines)
    file_content.close()
