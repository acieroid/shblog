#!/bin/sh

. $BASEDIR/lib/includes.sh

year="$1"

get_article_link() {
	echo "$BLOGURL/$article" | sed s_"$STATICDIR/"__
}

get_article_title() {
	get_article_link | sed s_"$BLOGURL/"__ | cut -d/ -f4
}

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
echo "			<h2>Archives for $year</h2>"
echo "			<ul>"
for article in `find_posts_html | grep "$year"`; do
echo "				<li><a href="`get_article_link`">`get_article_title`</a></li>"
done
echo "			</ul>"
echo "		</div>"
echo "		<p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
get_custom_foot
echo "	</body>"
echo "</html>"
