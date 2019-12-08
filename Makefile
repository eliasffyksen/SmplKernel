
SRC=./src
BIN=./bin
CONFIGS=./configs

boot: $(SRC)/boot/boot.s
	mkdir -p $(BIN)
	i686-elf-as $< -o $(BIN)/boot.o

kernel: $(SRC)/kernel/kernel.c
	mkdir -p $(BIN)
	i686-elf-gcc -c $< -o $(BIN)/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

link: boot kernel
	mkdir -p $(BIN)
	i686-elf-gcc -T $(SRC)/linker/linker.ld \
		-o $(BIN)/OS.bin \
		-ffreestanding -O2 -nostdlib \
		$(BIN)/boot.o $(BIN)/kernel.o \
		-lgcc

grub-test: link
	echo "Testing for multiboot compatability"
	grub-file --is-x86-multiboot $(BIN)/OS.bin

iso: grub-test $(CONFIGS)/grub.cfg
	mkdir -p $(BIN)
	rm -fr isodir
	mkdir -p isodir/boot/grub
	cp $(BIN)/OS.bin isodir/boot
	cp $(CONFIGS)/grub.cfg isodir/boot/grub
	grub-mkrescue -o $(BIN)/OS.iso isodir

bochs: $(CONFIGS)/bochs.config iso
	mkdir -p log
	bochs -f $<

clean:
	rm -fr $(BIN)
	rm -fr isodir
	rm -fr log
