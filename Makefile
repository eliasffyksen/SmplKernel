
SRC=./src
BIN=./bin

boot: $(SRC)/boot/boot.s
	i686-elf-as $< -o $(BIN)/boot.o

kernel: $(SRC)/kernel/kernel.c
	i686-elf-gcc -c $< -o $(BIN)/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

