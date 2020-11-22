
ARCHDIR=arch/$(ARCH)

SRCS=$(shell find kernel $(ARCHDIR) \( -name "*.c" -o -name "*.S" \))

OBJS=$(SRCS:.c=.o)
OBJS:=$(OBJS:.S=.o)

CFLAGS+=-I$(INCLUDEDIR) -ffreestanding -nostdlib
LIBS=-L$(LIBDIR) -lk

lssrc:
	echo $(SRCS)

SmplOS.kernel: $(OBJS) $(ARCHDIR)/linker.ld $(LIBDIR)/libk.a
	$(CC) $(CFLAGS) -T $(ARCHDIR)/linker.ld -o $@ $(OBJS) $(LIBS)
	grub-file --is-x86-multiboot $@

%.o: %.S
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

install: install-headers install-kernel

install-headers:
	mkdir -p $(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(INCLUDEDIR)/.

install-kernel: SmplOS.kernel
	mkdir -p $(BOOTDIR)
	cp SmplOS.kernel $(BOOTDIR)

clean:
	rm -f $(OBJS)