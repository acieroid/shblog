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

# Settings
. $LIBDIR/gettext.sh # Localization
. $LIBDIR/settings.sh # User preferences
export LANG=$BLOGLANG

# Functions
. $LIBDIR/post-includes.sh
. $LIBDIR/functions.sh
