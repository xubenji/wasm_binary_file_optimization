if [ $# -ne 1 ]; then
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-02 15:05:41
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-09 16:44:50
 # @FilePath: /wasm-binary-size-study/4_encode/handle_three_lines/all.sh
 # @Description: 获取原始数据
### 
  echo "Usage: $0 <filename>"
  exit 1
fi
# rm -rf *txt

bash 1_check_lines.sh $1
echo "complete 1check"
bash 2_merged.sh 1_check_lines_output.txt 2
echo "complete merge 2"
bash 2_merged.sh 1_check_lines_output.txt 3
echo "complete merge 3"
bash 2_merged.sh 1_check_lines_output.txt 4
echo "complete merge 4"
bash 2_merged.sh 1_check_lines_output.txt 5
echo "complete merge 5"
bash 2_merged.sh 1_check_lines_output.txt 6
echo "complete merge 6"


for i in {1..6}
do
  if [ $i -eq 1 ]; then
    echo "输出1"
  elif [ $i -eq 2 ]; then
    echo "输出2"

    bash 3_caculate_repeat.sh 2_merged_output_2lines.txt >> 3_caculate_output_2lines.txt
    echo "complete 3caculate"
    bash 4_sort.sh 3_caculate_output_2lines.txt 4_sort_output_2lines.txt
    echo "complete 4sort"
  elif [ $i -eq 3 ]; then
    echo "输出3"
    bash 3_caculate_repeat.sh 2_merged_output_3lines.txt >> 3_caculate_output_3lines.txt
    echo "complete 3caculate"
    bash 4_sort.sh 3_caculate_output_3lines.txt 4_sort_output_3lines.txt
    echo "complete 4sort"
  elif [ $i -eq 4 ]; then
    echo "输出4"
    bash 3_caculate_repeat.sh 2_merged_output_4lines.txt >> 3_caculate_output_4lines.txt
    echo "complete 3caculate"
    bash 4_sort.sh 3_caculate_output_4lines.txt 4_sort_output_4lines.txt
    echo "complete 4sort"
  elif [ $i -eq 5 ]; then
    echo "输出5"
    bash 3_caculate_repeat.sh 2_merged_output_5lines.txt >> 3_caculate_output_5lines.txt
    echo "complete 3caculate"
    bash 4_sort.sh 3_caculate_output_5lines.txt 4_sort_output_5lines.txt
    echo "complete 4sort" 
  else
    echo "输出6"
    bash 3_caculate_repeat.sh 2_merged_output_6lines.txt >> 3_caculate_output_6lines.txt
    echo "complete 3caculate"
    bash 4_sort.sh 3_caculate_output_6lines.txt 4_sort_output_6lines.txt
    echo "complete 4sort"
  fi
    
done

echo "done!"
