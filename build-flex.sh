#!/bin/sh
set -uex

root=$(pwd)

cd /tmp
FLEX_DIRNAME=flex-2.5.37
FLEX_ARCHIVE_NAME=$FLEX_DIRNAME.tar.bz2

curl -L http://prdownloads.sourceforge.net/flex/$FLEX_ARCHIVE_NAME?download > $FLEX_ARCHIVE_NAME

tar -jxf $FLEX_ARCHIVE_NAME
cd $FLEX_DIRNAME

./configure --prefix=/app/vendor
make -sj30
make -sj30 install

cp -a /app/vendor $root/
