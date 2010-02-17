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
. $LIBDIR/settings.sh

# post.sh
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
if [ -z $POSTNAME ]; then POSTNAME=post; fi
TODAYPOST=$TODAYDIR/`date +%H%M%S`-$POSTNAME.shpost

# Functions
. $LIBDIR/functions.sh

# Module
. $MODDIR/*.sh
