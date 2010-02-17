#!/bin/sh

LATESTNBR=5

function get_latest_posts {
	 find $DATADIR/ -name '*.shpost' | sort -r | head -n $LATESTNBR
}

echo "<h3>Latest posts</h3>"
echo "<ul id="latest-posts">"
for article in $(get_latest_posts); do # we use $article from main functions
	echo "	<li><a href="\"$(get_post_html_path)\"">$(get_title)</a></li>"
done
echo "</ul>"