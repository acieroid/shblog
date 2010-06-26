#!/bin/sh

. $LIBDIR/includes.sh

# Update timestamps database
for article in `find_posts`; do
	echo "$article `get_last_modif_timestamp $article'`" >> $TIMESTAMPSDB.new
done

# List modified files
cat $TIMESTAMPSDB $TIMESTAMPSDB.new | sort | uniq -u | cut -d' ' -f1 > $TIMESTAMPSDB.diff

# Generate modified files
for article in `cat $TIMESTAMPSDB.diff`; do
	postid=`basename $article | cut -d- -f1`
	$SHBLOG gen single $postid
done

# Generate index files
$SHBLOG gen index

# Use updated database as new database
mv $TIMESTAMPSDB.new $TIMESTAMPSDB
# Remove .diff file
rm $TIMESTAMPSDB.diff
