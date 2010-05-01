#!/bin/sh

# You shouldn't modify that
BINDIR=$BASEDIR/bin
LIBDIR=$BASEDIR/lib
DATADIR=$BASEDIR/data
STATICDIR=$BASEDIR/static
THEMEDIR=$STATICDIR/theme
MODDIR=$LIBDIR/modules
TMPDIR=$BASEDIR/tmp
LASTDU=$TMPDIR/lastdu

# Black magic crap that does the job
DATAPOSITION=`echo $DATADIR | tr '/' '\n' | wc -l`
let IDPOSITION=$DATAPOSITION+4

# Settings
. $LIBDIR/gettext.sh # Localization
. $LIBDIR/settings.sh # User preferences
export LANG=$BLOGLANG

# Functions
. $LIBDIR/functions.sh
. $LIBDIR/post-includes.sh
