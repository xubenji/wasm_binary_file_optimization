#!/bin/bash
cd $1
for file in *.bin; do
    binSize=`find . -type f -name "$file" -exec ls -l --block-size=1 {} \; | awk '{print $5}'`
    filetotalName=`find . -type f -name "$file" -exec ls -l --block-size=1 {} \; | awk '{print $9}'`
    num2=$(expr "`cat $filetotalName.dump.filter.decimal.total`" + 0)
    num1=$(expr "$binSize" + 0)

    IntangibleSize=$((num1-num2))
    echo "$filetotalName: $num1 - $num2" > $filetotalName.dump.filter.decimal.total.intangSize
    echo "BinarySize"  $num1 >> $filetotalName.dump.filter.decimal.total.intangSize
    echo "SectionSize"  $num2 >> $filetotalName.dump.filter.decimal.total.intangSize
    echo "Bin-Section"  $IntangibleSize >> $filetotalName.dump.filter.decimal.total.intangSize
done