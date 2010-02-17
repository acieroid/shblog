#!/bin/sh

. $BASEDIR/lib/includes.sh

echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
echo "<rss version=\"2.0\">"
echo "	<channel>"
echo "		<title>$BLOGTITLE</title>"
echo "		<link>$BLOGURL</link>"
echo "		<description>$BLOGDESC</description>"
echo "		<lastBuildDate>`date`</lastBuildDate>"
echo "		<language>$BLOGLANG</language>"
for article in $(find $DATADIR/ -name '*.shpost' | sort -r); do
	echo "		<item>"
	echo "			<title>$(get_title)</title>"
	echo "			<link>$(get_www_link)</link>"
	echo "			<guid>$(get_www_link)</guid>"
	echo "			<pubDate>$(get_date)</pubDate>"
	echo "			<description>$(get_post)</description>"
	echo "		</item>"
done
echo "	</channel>"
echo "</rss>"
