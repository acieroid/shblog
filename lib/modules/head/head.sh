#!/bin/sh

# include headscripts
get_custom_head() {
	for headscript in $MODDIR/*/*_head.sh; do
		module=`basename $headscript | sed 's/_head.sh//'`
		if [ "`grep $module $CONFDIR/modules.conf`" != "" ]; then
			test -f "$headscript" || continue
			. $headscript
		fi
	done
}
