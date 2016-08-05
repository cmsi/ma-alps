#!/bin/sh

SCRIPT_DIR=$(dirname $0)
DATA_DIR="/data"

DATE=$(head -1 ${SCRIPT_DIR}/alps/debian/changelog | sed 's/[:~-]/ /g' | awk '{print $3}')
REV=$(head -1 ${SCRIPT_DIR}/alps/debian/changelog | sed 's/[:~-]/ /g' | awk '{print $4}')

BUILD_DIR="alps_$DATE~$REV"

echo "SCRIPT_DIR: $SCRIPT_DIR"
echo "DATA_DIR: $SCRIPT_DIR"
echo "BUILD_DIR: $BUILD_DIR"
echo "VERSION: $DATE-$REV"

if [ -f "$DATA_DIR/alps-$DATE-$REV.tar.gz" ]; then :; else
  echo "Error: $DATA_DIR/alps-$DATE-$REV.tar.gz not found"
  exit 127
fi
if [ -d "$BUILD_DIR" ]; then
  echo "Error: $BUILD_DIR already exists"
  exit 127
fi

set -x

tar zxf $DATA_DIR/alps-$DATE-$REV.tar.gz
mv alps-$DATE-$REV $BUILD_DIR
cp -fp $DATA_DIR/alps-$DATE-$REV.tar.gz $BUILD_DIR.orig.tar.gz
cp -frp $SCRIPT_DIR/alps/debian $BUILD_DIR

cd $BUILD_DIR 
dpkg-buildpackage -us -uc
