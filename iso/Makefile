
ISODIR=$(BUILDDIR)/isodir

HEADERS=$(shell \
	find $(INCLUDEDIR) \
	-path $(INCLUDEDIR)/kernel -prune -false -o \
	-name "*.h" \
)
HEADERS:=$(HEADERS:$(INCLUDEDIR)/%=$(ISODIR)/include/%)

LIBS=$(shell \
	find $(LIBDIR) \
	-name "lib*.a" -not -name libk.a \
)
LIBS:=$(LIBS:$(LIBDIR)/%=$(ISODIR)/lib/%)

.PHONY: build

FILES=\
	$(LIBS) \
	$(HEADERS) \
	$(ISODIR)/boot/grub.cfg \
	$(ISODIR)/boot/SmplOS.kernel \

build: $(FILES) $(ISO)

$(ISO): $(ISODIR)
	grub-mkrescue -o $@ $<

$(ISODIR)/lib/%: $(LIBDIR)/%
	mkdir -p $(shell dirname $@)
	cp --preserve=timestamps  $< $@
	touch $(ISODIR)

$(ISODIR)/include/%: $(INCLUDEDIR)/%
	mkdir -p $(shell dirname $@)
	cp --preserve=timestamps  $< $@
	touch $(ISODIR)

$(ISODIR)/boot/grub.cfg: grub.cfg
	mkdir -p $(shell dirname $@)
	cp --preserve=timestamps $< $@
	touch $(ISODIR)

$(ISODIR)/boot/SmplOS.kernel: $(KERNEL)
	mkdir -p $(shell dirname $@)
	cp --preserve=timestamps $< $@
	touch $(ISODIR)
