#!/bin/sh

# include headscripts
get_custom_head() {
	for headscript in $MODDIR/*/*_head.sh; do
		test -f "$headscript" || continue
		. $headscript
	done
}
