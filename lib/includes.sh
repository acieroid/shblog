#!/bin/sh

# You shouldn't modify that
BINDIR=$BASEDIR/bin
LIBDIR=$BASEDIR/lib
DATADIR=$BASEDIR/data
STATICDIR=$BASEDIR/static
THEMEDIR=$STATICDIR/theme
STYLEDIR=$THEMEDIR

# post.sh
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
TODAYPOST=$TODAYDIR/`date +%H%M%S`-$POSTNAME.shpost
EDITOR=vim

# You shall modify the title of your blog
BLOGTITLE=shblog

# Let's include functions eventually!
. $LIBDIR/functions.sh
# Client-side variables
. $LIBDIR/client.sh
