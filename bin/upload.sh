#!/bin/sh

. $BASEDIR/lib/includes.sh

# Methods
case "$2" in
	scp)
		scp -P $SCPPORT -r $STATICDIR/* $SCPUSER@$SCPHOST:$SCPRDIR
	;;
esac
