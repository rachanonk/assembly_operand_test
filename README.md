# assembly_operand_test
try to do this on linux with nasm and test editor
nasm -f elf64 -o divide-test.o divide-test.asm
ld -o divide-test divide-test.o
./divide-test
