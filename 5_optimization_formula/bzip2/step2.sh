
rm -rf bzip2.opcode
cp bzip2.opcode.bake bzip2.opcode
bash 6_replace.sh bzip2.opcode rcode
echo "org size:"
bash 7_total_char.sh bzip2.opcode.bake
echo "size after optimize:"
bash 7_total_char.sh bzip2.opcode
