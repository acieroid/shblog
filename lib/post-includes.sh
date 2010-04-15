#!/bin/sh

# bin/post.sh uses that
function get_post_id {
	if [ "`find $DATADIR/ -name '*.shpost'`" == "" ]
	then
		export POSTID=1
	else
		for i in $(find $DATADIR/ -name '*.shpost' | sort -t '/' -k 5 -nr); do
			LASTID=`basename "$i" | cut -d- -f1`
		done
		POSTID=$(($LASTID+1))
	fi
}

get_post_id

POSTNAME=$2
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
if [ -z "$POSTNAME" ]; then POSTNAME=post; fi
TODAYPOST=$TODAYDIR/$POSTID-$POSTNAME.shpost
