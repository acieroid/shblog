#!/bin/sh

# if rss module is enabled, add rss link in <head>
function display_head {
	echo "		<link rel="alternate" type="application/rss+xml" title="$BLOGTITLE" href="/$WWWDIR/rss.xml" />"
}
