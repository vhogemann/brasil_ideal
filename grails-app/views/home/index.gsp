<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
			<a id="bt_show_game_list" style="border:1px solid #000;background-color:#ccc;width:110px;height:25px;text-align:center;display:block;text-decoration:none;cursor:pointer;">Lista de Jogos</a>
			<ul id="games-list" style="display:none">
				<h2>Lista de Jogos</h2>
				<li><a href="#" id="all_games">Todos os Jogos</a></li>
				<g:each in="${games}" status="i" var="game">
					<li>
						<a href="#" id="game_${game.id}"><g:game value="${game}"/></a>
					</li>
				</g:each>
			</ul>
		</form>
	</body>
</html>