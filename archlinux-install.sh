#!/bin/sh

INSTALL="/bin/install -c"
CONFDIR="/etc/shblog"
BINDIR="/usr/bin"
BASEDIR="/usr/share/shblog"
LIBDIR="/usr/lib/shblog"
DATADIR="/var/spool/shblog"
STATICDIR="/var/cache/shblog"

$INSTALL -d ${pkgdir}/$BASEDIR
$INSTALL -d ${pkgdir}/$BASEDIR/archives
$INSTALL -m755 bin/archives/year.sh ${pkgdir}/$BASEDIR/archives
$INSTALL -m755 bin/clean.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/gen.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/index.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/post.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/sidebar.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/single.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/update.sh ${pkgdir}/$BASEDIR
$INSTALL -m755 bin/upload.sh ${pkgdir}/$BASEDIR

$INSTALL -d ${pkgdir}/$CONFDIR
$INSTALL -m644 conf/modules.conf ${pkgdir}/$CONFDIR
$INSTALL -m644 conf/shblog.conf ${pkgdir}/$CONFDIR
$INSTALL -m644 conf/upload.conf ${pkgdir}/$CONFDIR

# i'd rather put data/1-first-post.shpost, and then install it in the current day
$INSTALL -d -m775 ${pkgdir}/$DATADIR
chmod o+t ${pkgdir}/$DATADIR
$INSTALL -d ${pkgdir}/$BASEDIR/data
$INSTALL -m644 data/2010/05/27/1-first-post.shpost ${pkgdir}/$BASEDIR/data

$INSTALL -d ${pkgdir}/$LIBDIR
$INSTALL -m644 lib/0.default ${pkgdir}/$LIBDIR
$INSTALL -m755 lib/functions.sh ${pkgdir}/$LIBDIR
$INSTALL -m755 lib/gettext.sh ${pkgdir}/$LIBDIR
$INSTALL -m755 lib/includes.sh ${pkgdir}/$LIBDIR
$INSTALL -m755 lib/post-includes.sh ${pkgdir}/$LIBDIR
$INSTALL -m755 lib/settings.sh ${pkgdir}/$LIBDIR
$INSTALL -d ${pkgdir}/$LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -m644 lib/locale/fr/LC_MESSAGES/shblog.mo ${pkgdir}/$LIBDIR/locale/fr/LC_MESSAGES
$INSTALL -d ${pkgdir}/$LIBDIR/modules
for i in "blogroll" "content" "dummy" "foot" "head" "latest" "markdown" "rss" "tagcloud"; do
    $INSTALL -d ${pkgdir}/$LIBDIR/modules/$i
    $INSTALL -m755 lib/modules/$i/$i.sh ${pkgdir}/$LIBDIR/modules/$i/$i.sh
done
$INSTALL -m644 lib/modules/blogroll/blogroll ${pkgdir}/$LIBDIR/modules/blogroll/blogroll
$INSTALL -d ${pkgdir}/$LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_content.sh ${pkgdir}/$LIBDIR/modules/comments
$INSTALL -m755 lib/modules/comments/disqus_foot.sh ${pkgdir}/$LIBDIR/modules/comments
$INSTALL -m644 lib/modules/markdown/readme ${pkgdir}/$LIBDIR/modules/markdown
$INSTALL -m644 lib/modules/markdown/md2html.awk ${pkgdir}/$LIBDIR/modules/markdown
$INSTALL -m755 lib/modules/rss/rss_head.sh ${pkgdir}/$LIBDIR/modules

$INSTALL -m755 shblog ${pkgdir}/$BINDIR

$INSTALL -d -m775 ${pkgdir}/$STATICDIR
chmod o+t ${pkgdir}/$STATICDIR
for i in "dark" "default"; do
    $INSTALL -d ${pkgdir}/$BASEDIR/static
    $INSTALL -m644 static/themes/$i/style.css ${pkgdir}/$BASEDIR/static/themes/$i
done