#!/bin/sh
set -e
. ./config.sh

mkdir -p "$SYSROOT"

for PROJECT in $SYSTEM_HEADER_PROJECTS; do
	echo "INSTALLING HEADERS: $PROJECT"
	(cd $PROJECT && DESTDIR="$SYSROOT" $MAKE install-headers)
done