# add link to <head>
rss_head() {
	echo "		<link rel="alternate" type="application/rss+xml" title="$BLOGTITLE" href="$BLOGURL/rss.xml" />"
}

# call function
rss_head
