#!/bin/sh

BASEDIR=$HOME/shblog
. $BASEDIR/lib/includes.sh

$BASEDIR/index.sh > $STATICDIR/index.html
