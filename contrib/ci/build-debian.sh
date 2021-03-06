#!/bin/sh
set -e
export LC_ALL=C.UTF-8
mkdir -p build && cd build
rm * -rf
meson .. \
    -Dgtkdoc=true \
    -Dtests=true $@
ninja -v || bash
ninja test -v
DESTDIR=/tmp/install-ninja ninja install
cd ..
