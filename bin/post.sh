#!/bin/sh

. $LIBDIR/includes.sh

# Post
[ -e $TODAYDIR ] || mkdir -p $TODAYDIR
cp $LIBDIR/0.default $TODAYPOST
sed -i s_"date::"_"date::`date '+%s'`"_ $TODAYPOST
sed -i s_"author::"_"author::$AUTHOR"_ $TODAYPOST

while [ "$EDIT" != "y" -a "$EDIT" != "n" ]; do
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

# Generate static pages
$SHBLOG gen single $POSTID
$SHBLOG gen index
