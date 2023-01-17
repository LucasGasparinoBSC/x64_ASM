# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
strlen: strlen.o
	gcc -g -o strlen strlen.o -ggdb -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv strlen bin && mv strlen.o obj && mv strlen.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l strlen.lst: generate a listing file
strlen.o: strlen.asm
	nasm -f elf64 -g -F dwarf strlen.asm -l strlen.lst

# Clean up the directory
clean:
	rm -rf bin obj lst