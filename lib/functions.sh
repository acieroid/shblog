# Works out post title
function get_title {
	cat $article | grep ^title:: | sed s/title:://
}

# Works out post tags
function get_tags {
	cat $article | grep ^tags:: | sed s/tags:://
}

# Displays the post without its headers
function get_post {
	cat $article | sed "1,3d"
}
