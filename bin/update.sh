#!/bin/sh

. $BASEDIR/lib/includes.sh

# Update timestamps database
for article in `find_posts`; do
	echo "$article `date -r $article '+%s'`" >> $TIMESTAMPSDB.new
done

# List modified files
cat $TIMESTAMPSDB $TIMESTAMPSDB.new | sort | uniq -u | cut -d' ' -f1 > $TIMESTAMPSDB.diff

# Generate modified files
for article in `cat $TIMESTAMPSDB.diff`; do
	postid=`basename $article | cut -d- -f1`
	$BASEDIR/shblog gen single $postid
done

# Use updated database as new database
mv $TIMESTAMPSDB.new $TIMESTAMPSDB
# Remove .diff file
rm $TIMESTAMPSDB.diff
