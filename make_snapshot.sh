#!/bin/sh

REVISION="$1"
DATE="$2"

URL=https://alps.comp-phys.org/svn/alps1/trunk/alps

if [ -z "$REVISION" ]; then
    REVISION=$(LANG=C TZ=GMT0 svn info "$URL" | grep '^Last Changed Rev:' | awk '{print $4}')
    DATE=$(LANG=C TZ=GMT0 svn info "$URL" | grep '^Last Changed Date:' | awk '{print $4}')
elif [ -z "$DATE" ]; then
    DATE=$(LANG=C TZ=GMT0 svn info "$URL" | grep '^Last Changed Date:' | awk '{print $4}')
fi
DATE=$(echo "$DATE" | sed 's/-//g')

echo "REVISION=$REVISION"
echo "DATE=$DATE"

DIR="alps-$DATE-r$REVISION"
rm -rf "$DIR"
svn export -r "$REVISION" "$URL" "$DIR"
tar zcvf "$DIR.tar.gz" "$DIR"

DIR2="alps_$DATE~r$REVISION"
rm -rf "$DIR2"
mv -f $DIR $DIR2
tar zcvf "$DIR2.orig.tar.gz" "$DIR2"

rm -rf "$DIR2"
