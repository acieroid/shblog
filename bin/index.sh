#!/bin/sh

. $BASEDIR/lib/includes.sh

enable_mod latest
enable_mod rss

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "	<head>"
echo "		<meta charset="utf-8">"
echo "		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />"
echo "		<title>$BLOGTITLE</title>"
echo "		<link rel="stylesheet" type="text/css" href=/$WWWDIR/theme/style.css media="screen" />"
echo "		<link rel="alternate" type="application/rss+xml" title="$BLOGTITLE" href="/$WWWDIR/rss.xml" />"
echo "	</head>"
echo "	<body>"
echo "		<h1 id="header"><a href="/$WWWDIR/index.html">$BLOGTITLE</a></h1>"
echo "		<span id="desc">$BLOGDESC</span>"
echo "		<div id="sidebar">"
		display_latest_posts
echo "		</div>"
echo "		<div id="content">"
for article in $(find $DATADIR/ -name '*.shpost' | sort -r); do
	echo "			<div class="post">"
	echo "				<h2 class="post-title"><a href="\"$(get_post_html_path)\"">$(get_title)</a></h2>"
	if [ -n "`get_tags`" ]; then
		echo "				<span class="post-tags">Tags : $(get_tags_tab)</span>"
	fi
	echo "				<span class="post-author">by $(get_author)</span>"
	echo "				<div class="post-content">$(get_post)</div>"
	echo "				<hr />"
	echo "			</div>"
	gen_post_html
done
echo "		</div>"
echo "		<p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
echo "	</body>"
echo "</html>"
