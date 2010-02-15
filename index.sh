#!/bin/sh
BASEDIR=$HOME/shblog
. $BASEDIR/lib/includes.sh

echo "Content-type: text/html\n"

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "	<head>"
echo "		<title>$BLOGTITLE</title>"
echo "	</head>"
echo "	<body>"
echo "		<h1 id="header">$BLOGTITLE</h1>"
for article in $(find $DATADIR/ -name *.txt); do
	echo "		<h2 class="post-title">$(get_title)</h2>"
	echo "		<p class="post-tags">$(get_tags)</p>"
	echo "		<div class="post-content">$(get_post)</div>"
	echo "		<hr />"
done
echo "	</body>"
echo "</html>"
