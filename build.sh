#!/bin/sh

set -e
. ./config.sh
# . ./headers.sh

for PROJECT in $PROJECTS; do
	echo "BUILDING: $PROJECT"
	(cd $PROJECT && make install)
done
