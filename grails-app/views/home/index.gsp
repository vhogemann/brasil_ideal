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
		
		<div class="toast">
			<span class="toastTitle">${location.name}</span>
			<div class="toastMatch">
				<div id="team1">${}</div>
				<div id="team2">${}</div>
			</div>
			<div class="toastDateGroup">
				<span id="toastDate">Data : ${}</span>
				<span id="toastTime">Horário : ${}</span>
			</div>
		</div>
	</body>

</html>