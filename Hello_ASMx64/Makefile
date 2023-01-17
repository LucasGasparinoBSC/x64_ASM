# Use GCC to link the object file into a binary executable
# Options:
# 	-no-pie: disable position independent executable
hello: hello.o
	gcc -o hello hello.o -no-pie
	mkdir -p bin && mkdir -p obj && mkdir -p lst
	mv hello bin && mv hello.o obj && mv hello.lst lst

# Use NASM to assemble the source file into an object file
# Options:
# 	-f elf64: output format is 64-bit ELF
# 	-g: generate debugging information
# 	-F dwarf: debugging information format is DWARF
# 	-l hello.lst: generate a listing file
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst

# Clean up the directory
clean:
	rm -rf bin obj lst