#!/bin/sh

function gen_rss {
        $BASEDIR/shblog.sh rss > $STATICDIR/rss.xml
}

gen_rss
