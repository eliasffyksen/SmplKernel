#!/bin/sh
. ./build.sh

mkdir -p isodir/boot/grub

cp sysroot/boot/SmplOS.kernel isodir/boot/SmplOS.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "SmplOS" {
	multiboot /boot/SmplOS.kernel
}
EOF
grub-mkrescue -o SmplOS.iso isodir
