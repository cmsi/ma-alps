#!/bin/sh

SCRIPT_DIR=$(dirname $0)
VERSION=$(sh $SCRIPT_DIR/version.sh)
VERSION_BASE=$(echo $VERSION | sed 's/-/ /g' | awk '{print $1}')
BUILD_DIR="alps_$VERSION_BASE"

echo "VERSION: $VERSION"
echo "VERSION_BASE: $VERSION_BASE"
echo "SCRIPT_DIR: $SCRIPT_DIR"
echo "BUILD_DIR: $BUILD_DIR"

DATA_DIR="/data/src"
echo "DATA_DIR: $DATA_DIR"

VERSION_ARCHIVE=$(echo $VERSION_BASE | sed 's/~/-/g')

if [ -f "$DATA_DIR/alps-$VERSION_ARCHIVE.tar.gz" ]; then :; else
  echo "Error: $DATA_DIR/alps-$VERSION_ARCHIVE.tar.gz not found"
  exit 127
fi
if [ -d "$BUILD_DIR" ]; then
  echo "Error: $BUILD_DIR already exists"
  exit 127
fi

set -x

tar zxf $DATA_DIR/alps-$VERSION_ARCHIVE.tar.gz
mv alps-$VERSION_ARCHIVE $BUILD_DIR
tar zcf alps-$VERSION_BASE.tar.gz $BUILD_DIR
cp -frp $SCRIPT_DIR/alps/debian $BUILD_DIR
cd $BUILD_DIR
dch --release "" --distribution $(lsb_release -s -c) --force-distribution
