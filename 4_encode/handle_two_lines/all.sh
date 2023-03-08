if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

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
