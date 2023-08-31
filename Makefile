ASM_FILES = $(wildcard *.asm)
OBJ_FILES = $(ASM_FILES:.asm=.tap)

.PHONY: all

all: $(OBJ_FILES)
	@echo "All assembly files processed"

%.tap: %.asm
	@echo "Building tape file $@ from $<"
	@pasmo --tapbas $< $@

clean:
	@rm *.tap
	@rm *.bin
	@echo "All object files removed"