#!/bin/sh

. $BASEDIR/lib/includes.sh

# Let's be clear about that
POSTID="$3"

case "$2" in
	index)
		$BINDIR/index.sh > $STATICDIR/index.html
		;;
	single)
		get_article_by_id $POSTID
		gen_post_html
		;;
	*) # consistency
		$BINDIR/index.sh > $STATICDIR/index.html
		;;
esac
