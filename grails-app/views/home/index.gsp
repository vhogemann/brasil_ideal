<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="bootstrap"/>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require module="googlemaps"/>
	</head>
	<body>
		<input type="button" id="center" value="Centralizar"/>
		<div id="map_canvas" style="width:640px; height:480px;">&nbsp;</div>
	</body>
</html>