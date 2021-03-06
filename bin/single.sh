#!/bin/sh

. $LIBDIR/includes.sh

POSTTITLE="$1"
POSTTAGS="$2"
POSTAUTHOR="$3"
POSTCONTENT="$4"

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
echo "          <h1 id="header"><a href="$BLOGURL/index.html">$BLOGTITLE</a></h1>"
echo "          <span id="desc">$BLOGDESC</span>"
# get_sidebar
# since the sidebar is a dynamic part of your blog, displaying it on each post
# will force you into regenerating the whole thing everytime.
echo "          <div id="content">"
echo "			<div class="post">"
echo "				<h2 class="post-title">$POSTTITLE</h2>"
echo "				<span class="post-tags">Tags : $POSTTAGS</span>"
echo "        <span class="post-date">Date : $(get_date "+$DATEFORMAT")</span>"
echo "				<span class="post-author">by $POSTAUTHOR</span>"
echo "				<div class="post-content">$POSTCONTENT</div>"
get_custom_content
echo "			</div>"
echo "		</div>"
echo "          <p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
get_custom_foot
echo "	</body>"
echo "</html>"
