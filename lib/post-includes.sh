#!/bin/sh

# bin/post.sh uses that
get_post_id() {
	if [ "`find $DATADIR/ -name '*.shpost'`" == "" ]
	then
		export POSTID=1
	else
		for i in $(find_posts_asc); do
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
