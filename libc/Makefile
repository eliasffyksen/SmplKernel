
SRCS=$(wildcard libc/**/*.c) $(wildcard libc/**/*.S)

OBJS=$(SRCS:.c=.o)
OBJS:=$(OBJS:.S=.o)
OBJS:=$(OBJS:%=$(BUILDDIR)/%)

HEADERS=$(shell find include -name "*.h")
HEADERS:=$(HEADERS:include/%=%)

LIBK_OBJS=$(filter-out %.libc.o,$(OBJS))
LIBC_OBJS=$(filter-out %.libk.o,$(OBJS))

CFLAGS+=-I$(INCLUDEDIR) -nostdlib -ffreestanding

.PHONE: build includes build-libc build-libk clean

build: includes build-libc build-libk

clean:
	rm -f $(LIBDIR)/libk.a
	rm -f $(LIBDIR)/libc.a
	rm -fr $(BUILDDIR)/libc

includes: $(HEADERS:%=$(INCLUDEDIR)/%)
$(INCLUDEDIR)/%.h: include/%.h
	mkdir -p $(shell dirname $@)
	cp -R --preserve=timestamps $< $@

build-libk: $(LIBDIR)/libk.a
$(LIBDIR)/libk.a: $(LIBK_OBJS)
	mkdir -p $(shell dirname $@)
	$(AR) rcs $@ $^

build-libc: $(LIBDIR)/libc.a
$(LIBDIR)/libc.a: $(LIBC_OBJS)
	mkdir -p $(shell dirname $@)
	$(AR) rcs $@ $^

$(BUILDDIR)/%.o: %.c
	mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILDDIR)/%.o: %.S
	mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -c -o $@ $<
