#!/bin/sh

. $BASEDIR/lib/includes.sh

# Define page number
pagenum="$1"

echo "<!DOCTYPE html>"
echo $(eval_gettext '<html lang="en">')
echo "	<head>"
echo "		<meta charset="utf-8">"
echo "		<meta http-equiv="Content-Type" content=\"text/html; charset=utf-8\" />"
echo "		<title>$BLOGTITLE</title>"
echo "		<link rel="stylesheet" type="text/css" href="$BLOGURL/themes/$BLOGTHEME/style.css" media="screen" />"
get_custom_head
echo "	</head>"
echo "	<body>"
echo "		<h1 id="header"><a href="$BLOGURL/index.html">$BLOGTITLE</a></h1>"
echo "		<span id="desc">$BLOGDESC</span>"
get_sidebar
echo "		<div id="content">"
for article in $tmplist; do
	echo "			<div class="post">"
	echo "				<h2 class="post-title"><a href="\"$(get_www_link)\"">$(get_title)</a></h2>"
	if [ -n "`get_tags`" ]; then
		echo "				<span class="post-tags">Tags : $(get_tags_tab)</span>"
		echo "				<span class="post-date">Date : $(get_date '+%a %d %b %Y, %Hh%m')</span>"
	fi
	echo "				<span class="post-author">by $(get_author)</span>"
	echo "				<div class="post-content">$(get_post)</div>"
	echo "				<hr />"
	echo "			</div>"
done
# Pagination tests
echo "      <p id="pagination">"
if [ "$2" != "latest" ]; then
	echo "				<a href="$BLOGURL/index-$(($pagenum+1)).html">Next</a>"
fi
if [ "$pagenum" != 1 ]; then
	if [ "$pagenum" = 2 ]; then
		previndex=index.html
	else
		previndex="index-$(($pagenum-1)).html"
	fi
	echo "				<a href="$BLOGURL/$previndex">Previous</a>"
fi
echo "			</p>"
echo "		</div>"
echo "		<p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
get_custom_foot
echo "	</body>"
echo "</html>"
