#!/bin/sh

DATADIR=$BASEDIR/data
TODAYDIR=$DATADIR/`date +%Y`/`date +%m`/`date +%d`
TODAYPOST=$TODAYDIR/$1
. $BASEDIR/lib/functions.sh

BLOGTITLE=shblog
