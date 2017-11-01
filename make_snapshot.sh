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

rm -rf "alps_$DATE~r$REVISION"
svn export -r "$REVISION" "$URL" "alps_$DATE~r$REVISION"
tar zcvf "alps_$DATE~r$REVISION.orig.tar.gz" "alps_$DATE~r$REVISION"

rm -rf "alps_$DATE~r$REVISION"
