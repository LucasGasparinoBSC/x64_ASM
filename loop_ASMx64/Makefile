all: loop1 loop2

# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
loop1: loop1.o
	gcc -o loop1 loop1.o -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv loop1 bin && mv loop1.o obj && mv loop1.lst lst

loop2: loop2.o
	gcc -o loop2 loop2.o -no-pie
	mv loop2 bin && mv loop2.o obj && mv loop2.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l loop1.lst: generate a listing file
loop1.o: loop1.asm
	nasm -f elf64 -g -F dwarf loop1.asm -l loop1.lst

loop2.o: loop2.asm
	nasm -f elf64 -g -F dwarf loop2.asm -l loop2.lst

# Clean up the directory
clean:
	rm -rf bin obj lst