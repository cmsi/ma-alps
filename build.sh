#!/bin/sh

SCRIPT_DIR=$(dirname $0)
VERSION=$(sh $SCRIPT_DIR/version.sh)
VERSION_BASE=$(echo $VERSION | sed 's/-/ /g' | awk '{print $1}')
BUILD_DIR="alps_$VERSION_BASE"

echo "VERSION: $VERSION"
echo "VERSION_BASE: $VERSION_BASE"
echo "SCRIPT_DIR: $SCRIPT_DIR"
echo "BUILD_DIR: $BUILD_DIR"

cd $BUILD_DIR 
case "$(dpkg --print-architecture)" in
    amd64)
        dpkg-buildpackage -us -uc
        ;;
    i386)
        dpkg-buildpackage -b -us -uc
        ;;
esac
