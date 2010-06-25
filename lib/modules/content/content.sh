#!/bin/sh

# include contentscripts
get_custom_content() {
	for contentscript in $MODDIR/*/*_content.sh; do
		module=`basename $contentscript | sed 's/_content.sh//'`
		if [ "`grep $module $CONFDIR/modules.conf`" != "" ]; then
			test -f "$contentscript" || continue
			. $contentscript
		fi
	done
}
