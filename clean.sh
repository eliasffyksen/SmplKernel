#!/bin/sh
set -e
. ./config.sh

for PROJECT in $PROJECTS; do
	(cd $PROJECT && make clean)
done

