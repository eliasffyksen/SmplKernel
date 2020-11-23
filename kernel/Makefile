
ARCHDIR=arch/$(ARCH)

SRCS=$(shell find kernel $(ARCHDIR) \( -name "*.c" -o -name "*.S" \))

OBJS=$(SRCS:.c=.o)
OBJS:=$(OBJS:.S=.o)
OBJS:=$(OBJS:%=$(BUILDDIR)/%)

HEADERS=$(shell find include -name "*.h")
HEADERS:=$(HEADERS:include/%=%)

CFLAGS+=-I$(INCLUDEDIR) -ffreestanding -nostdlib
LIBS=-L$(LIBDIR) -lk

.PHONY: build

build: $(KERNEL)

$(KERNEL): $(OBJS) $(ARCHDIR)/linker.ld $(LIBDIR)/libk.a
	$(CC) $(CFLAGS) -T $(ARCHDIR)/linker.ld -o $@ $(OBJS) $(LIBS)
	grub-file --is-x86-multiboot $@

includes: $(HEADERS:%=$(INCLUDEDIR)/%)
$(INCLUDEDIR)/%.h: include/%.h
	mkdir -p $(shell dirname $@)
	cp -R --preserve=timestamps $< $@

$(BUILDDIR)/%.o: %.c
	mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILDDIR)/%.o: %.S
	mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -c -o $@ $<

