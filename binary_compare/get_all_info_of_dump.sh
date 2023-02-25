
#!/bin/bash
DIR=$1

bash dump.sh $DIR 
bash dump_to_filter.sh $DIR
bash filter_to_decimal.sh $DIR
bash decimal_to_sort.sh $DIR 
bash sort_to_intang.sh $DIR
bash final_infor.sh $DIR

