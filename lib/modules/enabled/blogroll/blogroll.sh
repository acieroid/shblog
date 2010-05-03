#!/bin/sh

BLOGROLLFILE=$MODDIR/enabled/blogroll/bloglist
IFS='
'

function get_blogroll {
	cat $BLOGROLLFILE
}

function display_blogroll {
	echo "			<h3>Blogroll</h3>"
	echo "			<ul id="blogroll">"
	for blogline in $(get_blogroll); do
		blog=`echo $blogline | cut -d' ' -f1`
		link=`echo $blogline | cut -d' ' -f2`
		echo "				<li><a href="$link">$blog</a></li>"
	done
	echo "			</ul>"
}
