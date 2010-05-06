#!/bin/sh

function get_post {
	POSTLINE=`cat $article | grep -n ^post:: | head -n 1 | cut -d: -f1`
	cat $article | sed "1,"$POSTLINE"d" | $MODDIR/enabled/markdown/markdown.pl
}
