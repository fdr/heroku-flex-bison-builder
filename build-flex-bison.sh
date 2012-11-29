#!/bin/sh
set -uex

root=$(pwd)

install_cwd() {
    ./configure --prefix=/app/vendor
    make -sj4
    make -sj4 install
}

cd /tmp
FLEX_DIRNAME=flex-2.5.37
FLEX_ARCHIVE_NAME=$FLEX_DIRNAME.tar.bz2

echo 'Downloading and building GNU Flex'
curl -L http://prdownloads.sourceforge.net/flex/$FLEX_ARCHIVE_NAME?download > $FLEX_ARCHIVE_NAME

tar -jxf $FLEX_ARCHIVE_NAME
pushd $FLEX_DIRNAME
install_cwd
popd

echo 'Downloading and building GNU Bison'
BISON_DIRNAME=bison-2.6
BISON_ARCHIVE_NAME=$BISON_DIRNAME.tar.xz

curl -LO http://ftp.gnu.org/gnu/bison/$BISON_ARCHIVE_NAME

tar -Jxf $BISON_ARCHIVE_NAME
pushd $BISON_DIRNAME
install_cwd
popd

cp -a /app/vendor $root/
