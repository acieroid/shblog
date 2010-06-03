#!/bin/sh

. $BASEDIR/lib/includes.sh

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "  <head>"
echo "          <meta charset="utf-8">"
echo "          <meta http-equiv="Content-Type" content=\"text/html; charset=utf-8\" />"
echo "          <title>$POSTTITLE - $BLOGTITLE</title>"
echo "          <link rel="stylesheet" type="text/css" href="$BLOGURL/themes/$BLOGTHEME/style.css" media="screen" />"
get_custom_head
echo "  </head>"
echo "  <body>"
echo "		<h1 id="header"><a href="$BLOGURL/index.html">$BLOGTITLE</a></h1>"
echo "		<span id="desc">$BLOGDESC</span>"
get_sidebar
echo "		<div id="content">"
# archives loop
for year in $@; do
	echo "<ul>"
	echo "	<li><a href="">$year</a></li>"
	echo "</ul>"
done
echo "		</div>"
echo "		<p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
get_custom_foot
echo "	</body>"
echo "</html>"
