#!/bin/sh

# include headscripts
function get_custom_head {
	for headscript in $MODDIR/enabled/*/*_head.sh; do
		. $headscript
	done
}
