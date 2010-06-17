#!/bin/sh

# Finds posts (desc)
find_posts() {
	find $DATADIR/ -name '*.shpost' | sort -t '/' -k $IDPOSITION -nr
}

find_posts_id() {
	find_posts | sed -e 's/^.*\/\([0-9][0-9]*\)[^/]*$/\1/'
}

# Find posts (asc)
find_posts_asc() {
	find $DATADIR/ -name '*.shpost' | sort -t '/' -k $IDPOSITION -n
}

# Find posts' HTML files
find_posts_html() {
	find $STATICDIR/*/ -name '*.html' | grep -v "$ARCHIVESDIR/" | sort -t '/' -k $IDPOSITION -nr
}

# Works out post title
get_title() {
	grep ^title:: $article | sed s/title:://
}

# Works out post timestamp
get_timestamp() {
	grep ^date:: $article | sed s/date:://
}

# Works out post date using its timestamp
get_date() {
	date -d "@`get_timestamp`" $1
}

# Works out post tags
get_tags() {
	grep ^tags:: $article | sed s/tags:://
}

# Works out a tags tab per post
get_tags_tab() {
	x=1
	y=1
	nbr=`get_tags | wc -w`
	while [ "$y" -le "$nbr" ]; do
		tag=`get_tags | cut -d' ' -f $x`
		tab[$x]=$tag
		x=$(($x+1))
		y="$x"
	done
	echo ${tab[*]} | sed s/" "/", "/g 
}

# Works out post author
get_author() {
	grep ^author:: $article | sed s/author:://
}

# Displays the post without its headers
get_post() {
	POSTLINE=`grep -n ^post:: $article | head -n 1 | cut -d: -f1`
	IFS='
	'
	for body in `sed "1,"$POSTLINE"d" $article`; do echo "<p>$body</p>"; done
}

# Displays the sidebar
get_sidebar() {
	. $BINDIR/sidebar.sh
}

# Find a post with its ID
get_article_by_id() {
	article=`find_posts | grep "/$1-"`
}

# Works out post name
get_post_clean_path() {
	basename $article .shpost
}

# Defines static path for one post
get_post_static_path() {
	echo $article | sed s_"$DATADIR"_"$STATICDIR"_ | sed s_".shpost"_".html"_
}

# Define HTML path for one post
get_post_html_path() {
	echo $article | sed s_"$DATADIR/"_""_ | sed s_".shpost"_".html"_
}

# Another dirty function
get_www_link() {
	echo $BLOGURL/`get_post_html_path`
}

# And another one (FIXME)
get_tag_link() {
	echo $BLOGURL/tag/$tag
}

# Generates HTML post
gen_post_html() {
	mkdir -p $STATICDIR/`dirname $article | sed s_"$DATADIR/"__`
	$BINDIR/single.sh "`get_title`" "`get_tags_tab`" "`get_author`" "`get_post`" > `get_post_static_path`
}

# Enable modules
mod_enable() {
	for module in $MODDIR/enabled/*; do
		modname=`basename $module`
		test -f "$module/$modname.sh" || continue
		. $module/$modname.sh
	done
}
