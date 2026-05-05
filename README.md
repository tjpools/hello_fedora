# HelloFedora NASM Example

This project demonstrates a simple NASM 64-bit Linux program for Linux that prints "Hello, Fedora!" and then displays the value of the stack pointer register (`rsp`) in hexadecimal.

## Program Overview

1. **Greeting:**
   - The program uses the Linux `write` syscall to print "Hello, Fedora!" to the terminal.

2. **Stack Pointer Output:**
   - Immediately after the greeting, the program reads the current value of the `rsp` register (the stack pointer).
   - It converts this value to a hexadecimal string and prints it to the terminal.
   - Example output:
     ```
     Hello, Fedora!
     0x00007ffcc1127980
     ```
   - The `rsp` register points to the top of the stack for the current process. Its value changes as functions are called and local variables are allocated.

## Build and Run

1. Assemble:
   nasm -f elf64 hello_fedora.asm

2. Link:
   ld -o hello_fedora hello_fedora.o

3. Run:
   ./hello_fedora

## Clean

To remove build artifacts:

    make clean
