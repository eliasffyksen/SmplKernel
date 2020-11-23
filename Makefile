
export SRCDIR?=$(CURDIR)
export BUILDDIR?=$(SRCDIR)/build
export TARGET?=i686-elf
export ARCH?=i386

export CC=clang --target=i686-pc-elf -march=i686 -fno-builtin
export CFLAGS=-O2 -Wall -Wextra
export AR=llvm-ar

export LIBDIR?=$(BUILDDIR)/lib
export INCLUDEDIR?=$(BUILDDIR)/include
export KERNEL?=$(BUILDDIR)/SmplOS.kernel
export ISO?=$(BUILDDIR)/SmplOS.iso

PROJECTS=libc kernel iso

.PHONY: build build-% includes-% clean clean-% qemu

build: includes-kernel $(PROJECTS:%=build-%)
build-%: PROJECT = $(@:build-%=%)
build-%:
	$(MAKE) -C $(PROJECT)

qemu: build
	qemu-system-$(ARCH) -cdrom $(ISO)

includes-%: PROJECT = $(@:includes-%=%)
includes-%: 
	$(MAKE) -C $(PROJECT) includes

clean: $(PROJECTS:%=clean-%)
	rm -fr $(INCLUDEDIR)/*
clean-%: PROJECT = $(@:clean-%=%)
clean-%: 
	$(MAKE) -C $(PROJECT) clean

