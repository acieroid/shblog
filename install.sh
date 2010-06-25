#!/bin/sh

INSTALL="/bin/install -c"
CONFDIR="/etc/shblog"
BINDIR="/usr/bin"
BASEDIR="/usr/share/shblog"
LIBDIR="/usr/lib/shblog"
DATADIR="/var/spool/shblog"
STATICDIR="/var/cache/shblog"

$INSTALL -d $1/$BASEDIR/bin
$INSTALL -d $1/$BASEDIR/bin/archives
$INSTALL -m755 bin/archives/year.sh $1/$BASEDIR/bin/archives
$INSTALL -m755 bin/clean.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/gen.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/index.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/post.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/sidebar.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/single.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/update.sh $1/$BASEDIR/bin
$INSTALL -m755 bin/upload.sh $1/$BASEDIR/bin

$INSTALL -d $1/$CONFDIR
$INSTALL -m644 conf/modules.conf $1/$CONFDIR
$INSTALL -m644 conf/shblog.conf $1/$CONFDIR
$INSTALL -m644 conf/upload.conf $1/$CONFDIR

# i'd rather put data/1-first-post.shpost, and then install it in the current day
$INSTALL -d -m775 $1/$DATADIR
chmod o+t $1/$DATADIR
$INSTALL -d $1/$BASEDIR/data
$INSTALL -m644 data/2010/05/27/1-first-post.shpost $1/$BASEDIR/data

$INSTALL -d $1/$LIBDIR
$INSTALL -m644 lib/0.default $1/$LIBDIR
$INSTALL -m755 lib/functions.sh $1/$LIBDIR
$INSTALL -m755 lib/gettext.sh $1/$LIBDIR
$INSTALL -m755 lib/includes.sh $1/$LIBDIR
$INSTALL -m755 lib/post-includes.sh $1/$LIBDIR
$INSTALL -m755 lib/settings.sh $1/$LIBDIR
$INSTALL -d $1/$LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -m644 lib/locale/fr/LC_MESSAGES/shblog.mo $1/$LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -d $1/$LIBDIR/modules
for i in "blogroll" "content" "dummy" "foot" "head" "latest" "markdown" "rss" "tagcloud"; do
    $INSTALL -d $1/$LIBDIR/modules/$i
    $INSTALL -m755 lib/modules/$i/$i.sh $1/$LIBDIR/modules/$i/$i.sh
done
$INSTALL -m644 lib/modules/blogroll/blogroll $1/$LIBDIR/modules/blogroll/blogroll
$INSTALL -d $1/$LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_content.sh $1/$LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_foot.sh $1/$LIBDIR/modules/comments
$INSTALL -m644 lib/modules/markdown/readme $1/$LIBDIR/modules/markdown
$INSTALL -m644 lib/modules/markdown/md2html.awk $1/$LIBDIR/modules/markdown
$INSTALL -m755 lib/modules/rss/rss_head.sh $1/$LIBDIR/modules

$INSTALL -d $1/$BINDIR
$INSTALL -m755 shblog $1/$BINDIR

$INSTALL -d -m775 $1/$STATICDIR
chmod o+t $1/$STATICDIR
for i in "dark" "default"; do
    $INSTALL -d $1/$BASEDIR/static/themes/$i
    $INSTALL -m644 static/themes/$i/style.css $1/$BASEDIR/static/themes/$i
done
