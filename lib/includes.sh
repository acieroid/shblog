#!/bin/sh

# You shouldn't modify that
BINDIR=$BASEDIR/bin
LIBDIR=$BASEDIR/lib
DATADIR=$BASEDIR/data
STATICDIR=$BASEDIR/static
THEMEDIR=$STATICDIR/theme
TMPDIR=$BASEDIR/tmp
MODDIR=$LIBDIR/modules
LASTDU=$TMPDIR/lastdu

# www dir
WWWBASE=/var/www
WWWDIR=shblog
BLOGURL=http://blog.url.com

# Settings
. $LIBDIR/gettext.sh # Localization
. $LIBDIR/settings.sh # User preferences
export LANG=$BLOGLANG

# post.sh
function get_post_id {
  if [ "`find $DATADIR/ -name '*.shpost'`" == "" ]
  then 
        export POSTID=1
  else
        for i in $(find $DATADIR/ -name '*.shpost' | sort); do
					LASTID=`basename "$i" | cut -d- -f1`
        done
				POSTID=$(($LASTID+1))
  fi
}

get_post_id

TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
if [ -z $POSTNAME ]; then POSTNAME=post; fi
TODAYPOST=$TODAYDIR/$POSTID-$POSTNAME.shpost

# Functions
. $LIBDIR/functions.sh

# Module
. $MODDIR/*.sh
