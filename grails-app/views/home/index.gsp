<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="bootstrap"/>
		<r:require module="autocomplete"/>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require module="googlemaps"/>
		<r:require module="index"/>
		<r:require module="countdown" />
	</head>
	<body>
		<input type="input" id="searchKey" class="searchKey" name="searchKey" />
		<input type="button" id="center" value="Centralizar"/>
		<div id="map_canvas" style="width:640px; height:480px;">&nbsp;</div>
		<div id="toasterPlace"></div>
	</body>
</html>