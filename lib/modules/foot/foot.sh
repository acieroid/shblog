#!/bin/sh

# include footscripts
get_custom_foot() {
	for footscript in $MODDIR/*/*_foot.sh; do
		test -f "$footscript" || continue
		. $footscript
	done
}
