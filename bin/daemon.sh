#!/bin/sh

. $BASEDIR/lib/includes.sh

LASTDU=$BASEDIR/tmp/lastdu

[ -e $TMPDIR ] || mkdir $TMPDIR
[ -e $LASTDU ] || du $DATADIR > $LASTDU

if [ "`du $DATADIR`" != "`cat $LASTDU`" ]
then
	$BINDIR/gen.sh
fi
