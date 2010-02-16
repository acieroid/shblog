#!/bin/sh

BASEDIR=$HOME/shblog
. $BASEDIR/lib/includes.sh

mkdir -p $TODAYDIR
cp $BASEDIR/lib/0.default $TODAYPOST

while [ "$EDIT" != "y" -a "$EDIT" != "n"  ]; do
	read -p "Do you want to edit your post? [y/n] " EDIT
	case "$EDIT" in
		y)
			vim $TODAYPOST
			;;
		n)
			echo "Don't forget to edit it later."
			;;
	esac
done

$BASEDIR/index.sh > $STATICDIR/index.html
