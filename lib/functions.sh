# Works out post title
function get_title {
	cat $article | grep ^title:: | sed s/title:://
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
function get_post_author {
	cat $article | grep ^author:: | sed s/author:://
}

# Displays the post without its headers
function get_post {
	cat $article | sed "1,4d"
}
