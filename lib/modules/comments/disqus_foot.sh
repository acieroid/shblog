disqussite=shblogexample

# comments count script
function comments_foot {
	echo "<script type=\"text/javascript\">
	//<![CDATA[
	(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
		if(links[i].href.indexOf('#disqus_thread') >= 0) {
			query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
		}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/$disqussite/get_num_replies.js' + query + '"></' + 'script>');
	})();
	//]]>
	</script>"
}

# call function
comments_foot
