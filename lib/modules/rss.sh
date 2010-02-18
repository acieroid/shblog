#!/bin/sh

function rss_gen {
        $MODDIR/rss_gen.sh > $STATICDIR/rss.xml
}

rss_gen
