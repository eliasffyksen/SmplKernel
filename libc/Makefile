
SRCS=$(wildcard libc/**/*.c) $(wildcard libc/**/*.S)
OBJS=$(SRCS:.c=.o)
OBJS:=$(OBJS:.S=.o)
HEADERS=$(shell find include -name "*.h")
HEADERS:=$(HEADERS:include/%=%)

LIBK_OBJS=$(filter-out %.libc.o,$(OBJS))
LIBC_OBJS=$(filter-out %.libk.o,$(OBJS))

CFLAGS+=-I$(INCLUDEDIR) -nostdlib -ffreestanding

install: install-headers install-libs 

clean:
	rm -f libc.a libk.a
	rm -f $(OBJS)

install-headers: $(HEADERS:%=$(INCLUDEDIR)/%)
$(INCLUDEDIR)/%.h: %.h
	mkdir -p $(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(INCLUDEDIR)/.

install-libs: $(LIBDIR)/libk.a $(LIBDIR)/libc.a 

libk.a: $(LIBK_OBJS)
	$(AR) rcs $@ $^

libc.a: $(LIBC_OBJS)
	$(AR) rcs $@ $^

$(LIBDIR)/lib%: lib%
	mkdir -p $(LIBDIR)
	cp $< $(LIBDIR)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

.S.o:
	$(CC) $(CFLAGS) -c -o $@ $<


