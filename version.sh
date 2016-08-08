#!/bin/sh

head -1 $(dirname $0)/alps/debian/changelog | sed 's/[():]/ /g' | awk '{print $3}'
