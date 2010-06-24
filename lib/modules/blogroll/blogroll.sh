#!/bin/sh

BLOGROLLFILE=$CONFDIR/blogroll

[ -e $BLOGROLLFILE ] || cp $MODDIR/blogroll/blogroll $BLOGROLLFILE

IFS='
'

get_blogroll() {
	cat $BLOGROLLFILE
}

display_blogroll() {
	echo "			<h3>Blogroll</h3>"
	echo "			<ul id="blogroll">"
	for blogline in $(get_blogroll); do
		comment=$(echo $blogline | grep -E "[:space:]*#")
		if [ "$comment" = "" ]; then
			blog=`echo $blogline | cut -d' ' -f1`
			link=`echo $blogline | cut -d' ' -f2`
			echo "				<li><a href="$link">$blog</a></li>"
		fi
	done
	echo "			</ul>"
}
