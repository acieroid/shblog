#!/bin/sh

display_tagcloud() {
	echo "			<h3>Tags</h3>"
	echo "			<ul id="tags">"
	tags=$(find_tags | sed -e 's/ /\n/g')
	for tag in $tags; do
		echo "				<li><a href="\"$(get_tag_link)\"">$tag</a></li>"
	done
	echo "			</ul>"
}
