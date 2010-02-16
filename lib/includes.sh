#!/bin/sh

# You shouldn't modify that
BINDIR=$BASEDIR/bin
LIBDIR=$BASEDIR/lib
DATADIR=$BASEDIR/data
STATICDIR=$BASEDIR/static
THEMEDIR=$STATICDIR/theme
TMPDIR=$BASEDIR/tmp
LASTDU=$TMPDIR/lastdu

# post.sh
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
if [ -z $POSTNAME ]; then POSTNAME=post; fi
TODAYPOST=$TODAYDIR/`date +%H%M%S`-$POSTNAME.shpost
EDITOR=vim

# You shall modify the title and description of your blog
BLOGTITLE=shblog
BLOGDESC="un blog en bash"

# Let's include functions eventually!
. $LIBDIR/functions.sh
# Client-side variables
. $LIBDIR/client.sh
