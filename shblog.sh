#/bin/sh

# Where is shblog installed?
export BASEDIR=$HOME/shblog
export POSTNAME=$2

case "$1" in
	index)
		$BASEDIR/bin/index.sh
		;;
	post)
		$BASEDIR/bin/post.sh
		;;
	gen)
		$BASEDIR/bin/gen.sh
		;;
	daemon)
		$BASEDIR/bin/daemon.sh
		;;
	*)
		echo "Usage: $0 {index|post|gen|daemon}"
		;;
esac
