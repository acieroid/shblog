#!/bin/sh

. $BASEDIR/lib/includes.sh

[ -e $TODAYDIR ] || mkdir -p $TODAYDIR
cp $LIBDIR/0.default $TODAYPOST
sed -i s_"date::"_"date::`date`"_ $TODAYPOST

while [ "$EDIT" != "y" -a "$EDIT" != "n"  ]; do
	read -p "Do you want to edit your post? [y/n] " EDIT
	case "$EDIT" in
		y)
			$EDITOR $TODAYPOST
			;;
		n)
			echo "Don't forget to edit it later."
			;;
	esac
done
