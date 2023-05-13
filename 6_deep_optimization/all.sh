
rm bzip2.opcode bzip2.size bzip2.size.output
cp 2_sort.txt bzip2.size
cp bzip2.opcode.bake bzip2.opcode
bash 6_replace.sh bzip2.opcode bzip2.size

echo "org size:"
bash 7_total_char.sh bzip2.opcode.bake
echo "size after optimize:"
bash 7_total_char.sh bzip2.opcode