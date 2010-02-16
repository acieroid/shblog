#!/bin/sh

BASEDIR=$HOME/shblog
. $BASEDIR/lib/includes.sh

LASTDU=$BASEDIR/tmp/lastdu

[ -e $LASTDU ] || du $DATADIR > $LASTDU

if [ "`du $DATADIR`" != "`cat $LASTDU`" ]
then
	$BASEDIR/gen.sh
fi
