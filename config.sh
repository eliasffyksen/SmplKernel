PROJECTS="libc kernel"
SYSTEM_HEADER_PROJECTS="libc kernel"

export TARGET=i686-elf
export ARCH=i386
export CC="clang --target=i686-pc-elf -march=i686 -fno-builtin"
export AR="llvm-ar"

export BUILDDIR=$PWD/build

export SYSROOT=$PWD/sysroot
export PREFIX=$SYSROOT/usr
export BOOTDIR=$SYSROOT/boot
export LIBDIR=$PREFIX/lib
export INCLUDEDIR=$PREFIX/include

export CFLAGS="-O2 -Wall -Wextra"
 