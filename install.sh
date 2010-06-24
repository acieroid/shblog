#!/bin/sh

INSTALL="/bin/install -c"
CONFDIR="/etc/shblog"
BINDIR="/usr/bin"
BASEDIR="/usr/share/shblog"
LIBDIR="/usr/lib/shblog"
DATADIR="/var/spool/shblog"
STATICDIR="/var/cache/shblog"

$INSTALL -d $BASEDIR
$INSTALL -d $BASEDIR/archives
$INSTALL -m755 bin/archives/year.sh $BASEDIR/archives
$INSTALL -m755 bin/clean.sh $BASEDIR
$INSTALL -m755 bin/gen.sh $BASEDIR
$INSTALL -m755 bin/index.sh $BASEDIR
$INSTALL -m755 bin/post.sh $BASEDIR
$INSTALL -m755 bin/sidebar.sh $BASEDIR
$INSTALL -m755 bin/single.sh $BASEDIR
$INSTALL -m755 bin/update.sh $BASEDIR
$INSTALL -m755 bin/upload.sh $BASEDIR

$INSTALL -d $CONFDIR
$INSTALL -m644 conf/modules.conf $CONFDIR
$INSTALL -m644 conf/shblog.conf $CONFDIR
$INSTALL -m644 conf/upload.conf $CONFDIR

# i'd rather put data/1-first-post.shpost, and then install it in the current day
$INSTALL -d -m775 $DATADIR
chmod o+t $DATADIR
$INSTALL -d $BASEDIR/data
$INSTALL -m644 data/2010/05/27/1-first-post.shpost $BASEDIR/data

$INSTALL -d $LIBDIR
$INSTALL -m644 lib/0.default $LIBDIR
$INSTALL -m755 lib/functions.sh $LIBDIR
$INSTALL -m755 lib/gettext.sh $LIBDIR
$INSTALL -m755 lib/includes.sh $LIBDIR
$INSTALL -m755 lib/post-includes.sh $LIBDIR
$INSTALL -m755 lib/settings.sh $LIBDIR
$INSTALL -d $LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -m644 lib/locale/fr/LC_MESSAGES/shblog.mo $LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -d $LIBDIR/modules
for i in "blogroll" "content" "dummy" "foot" "head" "latest" "markdown" "rss" "tagcloud"; do
    $INSTALL -d $LIBDIR/modules/$i
    $INSTALL -m755 lib/modules/$i/$i.sh $LIBDIR/modules/$i/$i.sh
done
$INSTALL -m644 lib/modules/blogroll/blogroll $LIBDIR/modules/blogroll/blogroll
$INSTALL -d $LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_content.sh $LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_foot.sh $LIBDIR/modules/comments
$INSTALL -m644 lib/modules/markdown/readme $LIBDIR/modules/markdown
$INSTALL -m644 lib/modules/markdown/md2html.awk $LIBDIR/modules/markdown
$INSTALL -m755 lib/modules/rss/rss_head.sh $LIBDIR/modules

$INSTALL -m755 shblog $BINDIR

$INSTALL -d -m775 $STATICDIR
chmod o+t $STATICDIR
for i in "dark" "default"; do
    $INSTALL -d $BASEDIR/static
    $INSTALL -m644 static/themes/$i/style.css $BASEDIR/static/themes/$i
done