
SRCS=$(wildcard libc/**/*.c) $(wildcard libc/**/*.S)
OBJS=$(SRCS:.c=.o)
OBJS:=$(OBJS:.S=.o)

LIBK_OBJS=$(filter-out %.libc.o,$(OBJS))
LIBC_OBJS=$(filter-out %.libk.o,$(OBJS))

CFLAGS+=-I$(INCLUDEDIR) -nostdlib -ffreestanding

install: install-headers install-libk.a install-libc.a 

clean:
	rm -f libc.a libk.a
	rm -f $(OBJS)

install-headers:
	mkdir -p $(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(INCLUDEDIR)/.

libk.a: $(LIBK_OBJS)
	$(AR) rcs $@ $^

libc.a: $(LIBC_OBJS)
	$(AR) rcs $@ $^

install-lib%: lib%
	mkdir -p $(LIBDIR)
	cp $< $(LIBDIR)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

.S.o:
	$(CC) $(CFLAGS) -c -o $@ $<


