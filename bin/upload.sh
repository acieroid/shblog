#!/bin/sh

. $LIBDIR/includes.sh

# Methods
case "$2" in
	scp)
		scp -P $SCPPORT -r $STATICDIR/* $SCPUSER@$SCPHOST:$SCPRDIR
	;;
esac
