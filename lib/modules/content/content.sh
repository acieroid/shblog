#!/bin/sh

# include contentscripts
get_custom_content() {
	for contentscript in $MODDIR/*/*_content.sh; do
		test -f "$contentscript" || continue
		. $contentscript
	done
}
