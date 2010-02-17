#!/bin/sh

# Works out post title
function get_title {
	cat $article | grep ^title:: | sed s/title:://
}

function get_date {
	cat $article | grep ^date:: | sed s/date:://
}

# Works out post tags
function get_tags {
	cat $article | grep ^tags:: | sed s/tags:://
}

function get_tags_tab {
	x=1
	y=1
	nbr=`get_tags | wc -w`
	while [ "$y" -le "$nbr" ]; do
		tag=`get_tags | cut -d, -f $x`
		tab[$x]=$tag
		x=$(($x+1))
		y="$x"
	done
	echo ${tab[*]} | sed s/" "/", "/g 
}

# Works out post author
function get_author {
	cat $article | grep ^author:: | sed s/author:://
}

# Displays the post without its headers
function get_post {
	cat $article | sed "1,5d"
}

function get_post_clean_path {
	basename $article .shpost
}

# Defines static path for one post
function get_post_static_path {
	echo $article | sed s_"$DATADIR"_"$STATICDIR"_ | sed s_".shpost"_".html"_
}

# Define HTML path for one post
function get_post_html_path {
        echo $article | sed s_"$DATADIR"_"/$WWWDIR"_ | sed s_".shpost"_".html"_
}

function get_www_link {
	echo $BLOGURL`get_post_html_path`
}

# Generates HTML post
function gen_post_html {
	mkdir -p $STATICDIR/`dirname $article | sed s_"$DATADIR/"__`
	$BINDIR/single.sh "`get_title`" "`get_tags_tab`" "`get_author`" "`get_post`" > `get_post_static_path`
}

function enable_mod {
	. $MODDIR/$1.sh
}
