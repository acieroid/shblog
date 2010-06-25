#!/bin/sh

# include footscripts
get_custom_foot() {
	for footscript in $MODDIR/*/*_foot.sh; do
		module=`basename $footscript | sed 's/_foot.sh//'`
		if [ "`grep $module $CONFDIR/modules.conf`" != "" ]; then
			test -f "$footscript" || continue
			. $footscript
		fi
	done
}
