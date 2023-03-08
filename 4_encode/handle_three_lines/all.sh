if [ $# -ne 1 ]; then
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-02 15:05:41
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-02 15:23:07
 # @FilePath: /wasm-binary-size-study/4_encode/handle_three_lines/all.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
  echo "Usage: $0 <filename>"
  exit 1
fi
rm -rf *txt

bash 1_check_lines.sh $1
echo "complete 1check"
bash 2_merged.sh 1_check_lines_output.txt
echo "complete 2merged"
bash 3_caculate_repeat.sh 2_merged_output.txt
echo "complete 3caculate"
bash 4_sort.sh 3_caculate_output.txt
echo "complete 4sort"
bash 5_Supplement.sh 4_sort_output.txt
bash 8_final.sh 5_modified_4_sort_output.txt
cp 5_modified_4_sort_output.txt 8_final.txt 
echo "done!"
