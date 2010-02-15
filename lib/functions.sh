function get_title {
	cat $article | grep ^title:: | sed s/title:://
}

function get_tags {
#	cat $article | grep ^tags:: | sed s/ŧ// | sed s_", "_"\n"_g
	cat $article | grep ^tags:: | sed s/tags:://
}

function get_post {
	cat $article | sed "1,3d"
}
