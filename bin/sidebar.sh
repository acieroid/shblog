#!/bin/sh

. $BASEDIR/lib/includes.sh

echo "		<div id="sidebar">"
		display_latest_posts
		display_blogroll
echo "		</div>"
