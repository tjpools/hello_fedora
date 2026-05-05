# Open hello_fedora in Ghidra
# Update GHIDRA_PATH below with the full path to your ghidraRun script once you find it.


ghidra:
	flatpak run org.ghidra_sre.Ghidra
ASM_SRC=hello_fedora.asm
OBJ=hello_fedora.o
BIN=hello_fedora

all: $(BIN)

$(BIN): $(OBJ)
	ld -o $@ $<

$(OBJ): $(ASM_SRC)
	nasm -f elf64 $< -o $@

run: $(BIN)
	./$(BIN)

clean:
	rm -f $(OBJ) $(BIN)
