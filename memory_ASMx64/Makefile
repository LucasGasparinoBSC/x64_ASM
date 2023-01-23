all: memory1

# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
memory1: memory1.o
	gcc -o memory1 memory1.o -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv memory1 bin && mv memory1.o obj && mv memory1.lst lst

memory2: memory2.o
	gcc -o memory2 memory2.o -no-pie
	mv memory2 bin && mv memory2.o obj && mv memory2.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l memory1.lst: generate a listing file
memory1.o: memory1.asm
	nasm -f elf64 -g -F dwarf memory1.asm -l memory1.lst

memory2.o: memory2.asm
	nasm -f elf64 -g -F dwarf memory2.asm -l memory2.lst

# Clean up the directory
clean:
	rm -rf bin obj lst