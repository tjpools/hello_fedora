# hello_fedora

`hello_fedora` is a small NASM x86-64 Linux example in the spirit of a classic `hello_world` introduction project.
It prints a greeting to standard output and then prints the current value of the stack pointer register (`rsp`) in hexadecimal.

This repository is meant to be both:
- a simple first assembly-language program, and
- a learning reference for how source code, linked binaries, hexdumps, disassembly output, and Ghidra analysis relate to one another.

## What the program does

When run, the program:
1. prints `Hello, Fedora!`
2. reads the current `rsp` value
3. converts that value to hexadecimal text
4. prints the hexadecimal stack pointer value

Example output:

```text
Hello, Fedora!
0x00007ffcc1127980
```

## Why the project is named `hello_fedora`

The name follows the same idea as a traditional `hello_world` project used as an introduction to programming.
Here, the example is tailored to Fedora/Linux and expanded slightly so learners can also study register usage, binary structure, linking, and disassembly output.

## Repository contents

### Source and build files

- `hello_fedora.asm` — NASM source code for the program
- `Makefile` — build, run, clean, and Ghidra helper target

### Learning artifacts

These files are intentionally included so others can compare different views of the same program.

- `hex.txt` — a hexdump of the resulting ELF binary
- `obj.txt` — `objdump` disassembly in AT&T syntax
- `obj_intel.txt` — `objdump` disassembly in Intel syntax
- `ghidra_output_example.txt` — shorter example of Ghidra disassembly output
- `ghidra_full_output.txt` — more complete Ghidra output for study and comparison

These artifacts are useful for linkage learning and for understanding how assembly source becomes machine code and how that machine code is interpreted by different tools.

## Build and run

### Assemble

```sh
nasm -f elf64 hello_fedora.asm -o hello_fedora.o
```

### Link

```sh
ld -o hello_fedora hello_fedora.o
```

### Run

```sh
./hello_fedora
```

## Using the Makefile

Build the program:

```sh
make
```

Run it:

```sh
make run
```

Clean build artifacts:

```sh
make clean
```

Open Ghidra from the helper target:

```sh
make ghidra
```

## What to compare while learning

If you are studying this project, a useful path is:

1. read `hello_fedora.asm`
2. compare it with `obj.txt`
3. compare `obj.txt` with `obj_intel.txt`
4. inspect `hex.txt` to see the ELF bytes directly
5. compare the objdump output with the Ghidra output files

This lets you see the same program at multiple levels:
- source code
- linked binary bytes
- AT&T syntax disassembly
- Intel syntax disassembly
- Ghidra analysis output

## Notes

- This is a Linux x86-64 NASM example.
- The `rsp` value changes depending on runtime context.
- The included analysis files are part of the teaching purpose of the repository, not accidental artifacts.
