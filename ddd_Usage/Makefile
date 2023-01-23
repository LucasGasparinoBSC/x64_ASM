# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
move: move.o
	gcc -o move move.o -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv move bin && mv move.o obj && mv move.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l move.lst: generate a listing file
move.o: move.asm
	nasm -f elf64 -g -F dwarf move.asm -l move.lst

# Clean up the directory
clean:
	rm -rf bin obj lst