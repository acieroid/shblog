#/bin/sh

# Where is shblog installed?
export BASEDIR=$HOME/shblog
export POSTNAME=$2

[ -d $TMPDIR ] || mkdir $TMPDIR

case "$1" in
	*)
		if [ -e $BASEDIR/bin/$1.sh ]
		then
			$BASEDIR/bin/$1.sh $@
		else
			echo "Usage: $0 {post|gen|daemon}"
		fi
		;;
esac
