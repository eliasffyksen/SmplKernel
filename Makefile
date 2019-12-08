
SRC=./src
BIN=./bin

boot: $(SRC)/boot/boot.s
	i686-elf-as $^ -o $(BIN)/boot.o
