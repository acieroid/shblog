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
	tags)
		tags=$(find_tags | sed -e 's/ /\n/g')
		for tag in $tags; do 
			tmp=""
			for article in $(find_posts); do
				is_good_tag=$(echo $(get_tags) | grep -v $tag)
				if [ "$is_good_tag" == "" ]; then
					tmp=$tmp\ $article
				fi
			done
			postsnbr=$(echo $tmp | sed -e 's/ /\n/g' | wc -l)
			postspos=0
			pagenum=1
			pagesuffix=""
			# work it out
			while [ "$postspos" -lt "$(($postsnbr-$INDEXPOSTS))" ]; do
				export tmplist=`echo $tmp | sed -e 's/ /\n/g' | head -n $(($postspos+$INDEXPOSTS)) | tail -n $INDEXPOSTS`
				if [ "$pagenum" -gt 1 ]; then
					pagesuffix="-$pagenum"
				fi
				# bring that shit in!
				$BINDIR/index.sh $pagenum > $STATICDIR/tag/$tag$pagesuffix.html
				# brain-dead AOLing
				postspos=$(($postspos+$INDEXPOSTS))
				pagenum=$(($pagenum+1))
			done
			# generate last page!
			export tmplist=`echo $tmp | sed -e 's/ /\n/g' | tail -n $(($postsnbr-$postspos))`
			export pagesuffix="-$pagenum"
			$BINDIR/index.sh $pagenum latest > $STATICDIR/tag/$tag$pagesuffix.html
		done
		;;
	single)
		get_article_by_id $POSTID
		gen_post_html
		#we should only regenerate the current tags
		$SHBLOG gen tags
		;;
	archives)
		archivesyears=`find_posts_html | sed s_"$STATICDIR/"__ | cut -d/ -f1`
		for year in $archivesyears; do
			[ -d $ARCHIVESDIR/$year ] || mkdir -p $ARCHIVESDIR/$year
			$BINDIR/archives/year.sh $year > $ARCHIVESDIR/$year/index.html
		done
		;;
	all)
		for POSTID in `find_posts_id`; do
			get_article_by_id $POSTID
			gen_post_html
			$SHBLOG gen index
			$SHBLOG gen tags
		done
		;;
	*)
		echo "Usage: shblog gen [index | single <ID> | all]"
		;;
esac
