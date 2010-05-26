#!/bin/sh

# include footscripts
function get_custom_foot {
	for footscript in $MODDIR/enabled/*/*_foot.sh; do
		test -f "$footscript" || continue
		. $footscript
	done
}
