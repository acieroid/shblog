#!/bin/sh

. $LIBDIR/includes.sh

echo "		<div id="sidebar">"
		display_latest_posts
		display_tagcloud
		display_blogroll
echo "		</div>"
