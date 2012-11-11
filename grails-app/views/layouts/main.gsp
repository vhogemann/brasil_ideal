<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js">
<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title>
			<g:layoutTitle default="PubCup" />
		</title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--%>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		
		<r:require module="bootstrap"/>
		<r:require module="jquery"/>

		<script type="text/javascript">
			var config = {contextPath: "${request.contextPath}"};
		</script>
		
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="page">
			<div id="header">
				<div class="header">
					<h1 class="logo"><a href="/" class="lnk">PubCup</a></h1>
				</div>
			</div>
			<div id="content">
				<g:layoutBody />
			</div>
			<div id="footer" role="contentinfo">
				<div id="fb-root"></div>
				<div class="fb-like" data-href="http://pubcup.com" data-send="true" data-width="450" data-show-faces="true"></div>
			</div>
		</div>

		<div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>
		
		<r:layoutResources />
		<script>
			(function(d, s, id) {
		  		var js, fjs = d.getElementsByTagName(s)[0];
		  		if (d.getElementById(id)) return;
		  		js = d.createElement(s); js.id = id;
		  		js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
		  		fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
	</body>
</html>