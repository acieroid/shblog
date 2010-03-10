#/bin/sh

# Where is shblog installed?
export BASEDIR=$HOME/shblog

# Localization
export TEXTDOMAINDIR=$BASEDIR/lib/locale
export TEXTDOMAIN=shblog

[ -d $TMPDIR ] || mkdir $TMPDIR

case "$1" in
	*)
		if [ -e $BASEDIR/bin/$1.sh ]
		then
			$BASEDIR/bin/$1.sh $@
		else
			echo "Usage: $0 {post|gen|daemon|clean}"
		fi
		;;
esac
