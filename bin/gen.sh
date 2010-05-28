#!/bin/sh

. $BASEDIR/lib/includes.sh

# Let's be clear about that
POSTID="$3"

case "$2" in
	index)
		# let's initialize some basic variables
		postsnbr=`find_posts | wc -l`
		postspos=0
		pagenum=1
		pagesuffix=""
		# work it out
		while [ "$postspos" -lt "$(($postsnbr-$INDEXPOSTS))" ]; do
			export tmplist=`find_posts | head -n $(($postspos+$INDEXPOSTS)) | tail -n $INDEXPOSTS`
			if [ "$pagenum" -gt 1 ]; then
				pagesuffix="-$pagenum"
			fi
			# bring that shit in!
			$BINDIR/index.sh $pagenum > $STATICDIR/index$pagesuffix.html
			# brain-dead AOLing
			postspos=$(($postspos+$INDEXPOSTS))
			pagenum=$(($pagenum+1))
		done
		# generate last page!
		export tmplist=`find_posts | tail -n $(($postsnbr-$postspos))`
		if [ "$pagenum" -gt "1" ]; then
			export pagesuffix="-$pagenum"
		fi
		$BINDIR/index.sh $pagenum latest > $STATICDIR/index$pagesuffix.html
		;;
	single)
		get_article_by_id $POSTID
		gen_post_html
		;;
	all)
		for POSTID in `find_posts_id`; do
			get_article_by_id $POSTID
			gen_post_html
			$BASEDIR/shblog gen index
		done
		;;
	*)
		echo "Usage: shblog gen index | single <ID> | all"
		;;
esac
