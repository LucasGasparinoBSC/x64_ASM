# Hello_ASMx64

Simple Hello World program written in x64 assembly. Credits to Jo Van Hoey for the original code, found at [http://www.jo-van-hoey.be/2013/01/assembly-x64-hello-world.html](http://www.jo-van-hoey.be/2013/01/assembly-x64-hello-world.html).

## Requirements

As explained in the book, this is a Linux-based source, so it must be built and run under a Linux-based OS. Additionaly, the following tools are required:

* NASM
* GCC

## Build

Simply enter the folder and run:

```bash
make
```

The binary executable will be added to the 'bin' folder, the binary object to the 'obj' folder, and the assembly listing to the 'lst' folder.