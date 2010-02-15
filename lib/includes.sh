#!/bin/sh

# You shouldn't modify that
DATADIR=$BASEDIR/data
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
TODAYPOST=$TODAYDIR/$1.txt

# You shall modify the title of your blog
BLOGTITLE=shblog

# Let's include functions eventually!
. $BASEDIR/lib/functions.sh
# Client-side variables
. $BASEDIR/lib/client.sh
