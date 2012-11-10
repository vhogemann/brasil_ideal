<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
<%--		<r:require module="bootstrap"/>--%>
		
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require module="index"/>
	</head>
	<body>
		<form action="" method="get">
			<input type="hidden" id="txtLatitude" name="txtLatitude" />
	        <input type="hidden" id="txtLongitude" name="txtLongitude" />
			<input type="text" id="searchKey" class="searchKey" name="searchKey" />
			<input type="button" id="center" value="Centralizar"/>
			<div id="map_canvas" style="width:640px; height:480px;">&nbsp;</div>
			<div id="toasterPlace"></div>
			<div id="new-location-template" style="display: none">
				<div class="address"></div>
				<a href="#replaceMe" class="btn btn-create"><g:message code="default.button.create.label" default="Create" /></a>
			</div>
		</form>
	</body>
</html>