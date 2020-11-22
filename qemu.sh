#!/bin/sh
set -e
. ./iso.sh

qemu-system-$ARCH -cdrom SmplOS.iso
