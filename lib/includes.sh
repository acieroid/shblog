#!/bin/sh

# You shouldn't modify that
BINDIR=$BASEDIR/bin
CONFDIR=$HOME/.config/shblog
ARCHIVESDIR=$STATICDIR/archives
THEMESDIR=$STATICDIR/themes
MODDIR=$LIBDIR/modules
# You shouldn't modify that either
TIMESTAMPSDB=$DATADIR/timestamps.db

# Black magic crap that does the job
DATAPOSITION=`echo $DATADIR | tr '/' '\n' | wc -l`
let IDPOSITION=$DATAPOSITION+4

# Settings
. $LIBDIR/gettext.sh # Localization
. $CONFDIR/shblog.conf # User preferences
. $CONFDIR/upload.conf # Upload settings
export LANG=$BLOGLANG

# Functions
. $LIBDIR/functions.sh
. $LIBDIR/post-includes.sh

# Enable modules listed in ~/.config/modules.conf
mod_enable
