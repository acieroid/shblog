#!/bin/sh

. $BASEDIR/lib/includes.sh

# Only if using CGI
#echo "Content-type: text/html"
#echo ""

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "	<head>"
echo "		<meta charset="utf-8">"
echo "		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />"
echo "		<title>$BLOGTITLE</title>"
echo "		<link rel="stylesheet" type="text/css" href="$STYLEDIR/style.css" media="screen" />"
echo "	</head>"
echo "	<body>"
echo "		<h1 id="header">$BLOGTITLE</h1>"
for article in $(find $DATADIR/ -name *.shpost); do
	echo "		<div class="post">"
	echo "			<h2 class="post-title">$(get_title)</h2>"
	echo "			<p class="post-tags">Tags : $(get_tags_tab)</p>"
	echo "			<div class="post-content">$(get_post)</div>"
	echo "			<hr />"
	echo "		</div>"
done
echo "	</body>"
echo "</html>"
