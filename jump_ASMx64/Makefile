# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
jump: jump.o
	gcc -o jump jump.o -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv jump bin && mv jump.o obj && mv jump.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l jump.lst: generate a listing file
jump.o: jump.asm
	nasm -f elf64 -g -F dwarf jump.asm -l jump.lst

# Clean up the directory
clean:
	rm -rf bin obj lst