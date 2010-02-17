#!/bin/sh

. $BASEDIR/lib/includes.sh

echo "<!DOCTYPE html>"
echo "<html lang="fr">"
echo "	<head>"
echo "		<meta charset="utf-8">"
echo "		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />"
echo "		<title>$BLOGTITLE</title>"
echo "		<link rel="stylesheet" type="text/css" href="theme/style.css" media="screen" />"
echo "	</head>"
echo "	<body>"
echo "		<h1 id="header">$BLOGTITLE</h1>"
echo "		<span id="desc">$BLOGDESC</span>"
echo "		<div id="content">"
echo "                  <div class="post">"
echo "                          <h2 class="post-title">$(get_title)</h2>"
if [ -n "`get_tags`" ]; then
	echo "                          <span class="post-tags">Tags : $(get_tags_tab)</span>"
fi
echo "                          <span class="post-author">by $(get_post_author)</span>"
echo "                          <div class="post-content">$(get_post)</div>"
echo "                          <hr />"
echo "                  </div>"
echo "		</div>"
echo "		<p id="footer">powered by <a href="http://github.com/addikt1ve/shblog">shblog</a>"
echo "	</body>"
echo "</html>"
