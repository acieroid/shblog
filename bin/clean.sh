#!/bin/sh

. $BASEDIR/lib/includes.sh

find $STATICDIR -type d -name "[0-9][0-9][0-9][0-9]" -exec rm -r {} \;
rm -rf $STATICDIR/index*.html $STATICDIR/rss.xml $TIMESTAMPSDB
