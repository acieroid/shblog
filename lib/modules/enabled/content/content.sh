#!/bin/sh

# include contentscripts
function get_custom_content {
	for contentscript in $MODDIR/enabled/*/*_content.sh; do
		test -f "$contentscript" || continue
		. $contentscript
	done
}
