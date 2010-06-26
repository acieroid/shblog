#!/bin/sh

RFC2822="%a, %d %b %Y %H:%M:%S %z"

rss_gen() {
	echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
	echo "<rss version=\"2.0\">"
	echo "	<channel>"
	echo "		<title>$BLOGTITLE</title>"
	echo "		<link>$BLOGURL</link>"
	echo "		<description>$BLOGDESC</description>"
	echo "		<lastBuildDate>`date +"$RFC2822"`</lastBuildDate>"
	echo "		<language>$BLOGLANG</language>"
	for article in $(find_posts); do
		echo "		<item>"
		echo "			<title>$(get_title)</title>"
		echo "			<link>$(get_www_link)</link>"
		echo "			<guid>$(get_www_link)</guid>"
		echo "			<pubDate>$(get_date +"$RFC2822")</pubDate>"
		echo "			<description>$(get_post)</description>"
		echo "		</item>"
	done
	echo "	</channel>"
	echo "</rss>"
}

rss_gen > $STATICDIR/rss.xml
