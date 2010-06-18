#!/bin/sh

display_tagcloud() {
	echo "			<h3>Tags</h3>"
	echo "			<ul id="tags">"
	for article in $(find_posts); do # we use $article from main functions
		tags=${tags}\ $(get_tags)
	done
	tags=$(echo $tags | sort | sed -e 's/ /\n/g' | uniq)
	for tag in $tags; do
		echo "				<li><a href="\"$(get_tag_link)\"">$tag</a></li>"
	done
	echo "			</ul>"
}