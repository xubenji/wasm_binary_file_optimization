
rm *txt
bash 1_check.sh $1
bash 2_column.sh t1_bzip-Oz_column2.txt
bash 3_delete_space.sh t2_2t1_bzip-Oz_column2_column1.txt
bash 4_merged.sh t2_2t1_bzip-Oz_column2_column1.txt
bash 5_caculate_repeat.sh t4_merged_output.txt
bash 7_sort.sh t5_caculate_output.txt 
