export TARGET=i686-elf
export ARCH=i386
export CC=clang --target=i686-pc-elf -march=i686 -fno-builtin
export AR=llvm-ar

export SYSROOT=$(CURDIR)/sysroot
export PREFIX=$(SYSROOT)/usr
export BOOTDIR=$(SYSROOT)/boot
export LIBDIR=$(PREFIX)/lib
export INCLUDEDIR=$(PREFIX)/include

export CFLAGS=-O2 -Wall -Wextra

PROJECTS=$(wildcard projects/*)
PROJECTS:=$(PROJECTS:projects/%=%)

ISO=SmplOS.iso

.PHONY: clean install install-libs install-headers iso qemu

install: install-headers install-libs $(PROJECTS:%=install-%)

install-libs: $(PROJECTS:%=install-libs-%)

install-headers: $(PROJECTS:%=install-headers-%)

qemu: iso FORCE
	qemu-system-$(ARCH) -cdrom $(ISO)

iso: $(ISO)

$(ISO): install grub.cfg
	mkdir -p $(BOOTDIR)/grub
	cp grub.cfg $(BOOTDIR)/grub
	grub-mkrescue -o $(ISO) $(SYSROOT)


clean: $(PROJECTS:%=clean-%)
	rm -fr $(SYSROOT)

PROJECT_MAKE_TARGETS=clean install install-headers install-libs
define PROJECT_MAKE_RULE
.PHONY: $(MAKE_TARGET)-$(PROJECT)
$(MAKE_TARGET)-$(PROJECT):
	$(MAKE) -C projects/$(PROJECT) $(MAKE_TARGET)
endef
define PROJECT_RULES
.PHONY: $(PROJECT)

$(PROJECT):
	$(MAKE) -C projects/$(PROJECT)

$(foreach MAKE_TARGET,$(PROJECT_MAKE_TARGETS),$(eval $(call PROJECT_MAKE_RULE)))
endef
$(foreach PROJECT,$(PROJECTS),$(eval $(call PROJECT_RULES)))

FORCE:
