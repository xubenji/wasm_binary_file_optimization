
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-03 14:40:47
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-03 14:50:16
 # @FilePath: /wasm-binary-size-study/4_encode/without_num_three_lines/all.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE*t
### 
rm *txt
bash 1_check.sh $1
bash 2_column.sh t1_bzip-Oz_column2.txt
bash 3_delete_space.sh t2_2t1_bzip-Oz_column2_column1.txt
bash 4_merged.sh t2_2t1_bzip-Oz_column2_column1.txt
bash 5_caculate_repeat.sh t4_merged_output.txt
bash 7_sort.sh t5_caculate_output.txt 
