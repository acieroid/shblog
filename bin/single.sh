#!/bin/sh

. $BASEDIR/lib/includes.sh

POSTTITLE="$1"
POSTTAGS="$2"
POSTAUTHOR="$3"
POSTCONTENT="$4"

enable_mod latest
enable_mod rss

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "  <head>"
echo "          <meta charset="utf-8">"
echo "          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />"
echo "          <title>$POSTTITLE - $BLOGTITLE</title>"
echo "          <link rel="stylesheet" type="text/css" href="/$WWWDIR/theme/style.css" media="screen" />"
echo "          <link rel="alternate" type="application/rss+xml" title="$BLOGTITLE" href="/$WWWDIR/rss.xml" />"
echo "  </head>"
echo "  <body>"
echo "          <h1 id="header"><a href="/$WWWDIR/index.html">$BLOGTITLE</a></h1>"
echo "          <span id="desc">$BLOGDESC</span>"
echo "		<div id="sidebar">"
		display_latest_posts
echo "		</div>"
echo "          <div id="content">"
echo "			<div class="post">"
echo "				<h2 class="post-title">$POSTTITLE</h2>"
echo "				<span class="post-tags">Tags : $POSTTAGS</span>"
echo "				<span class="post-author">by $POSTAUTHOR</span>"
echo "				<div class="post-content">$POSTCONTENT</div>"
echo "			</div>"
echo "		</div>"
echo "          <p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
echo "	</body>"
echo "</html>"
