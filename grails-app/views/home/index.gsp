<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require module="index" />
		<r:require module="countdown" />
		<r:require module="kkcountdown" />
	</head>
	<body>
		<form action="" method="get" onsubmit="return false;">
			<div class="search-area">
				<fieldset>
					<label for="searchKey">
						<span class="lbl">Search</span>
						<input type="hidden" id="txtLatitude" name="txtLatitude" />
						<input type="hidden" id="txtLongitude" name="txtLongitude" />
						<input type="text" id="searchKey" class="searchKey" name="searchKey" />
					</label>
					<span class="search">
						<input class="bt" type="button" value="pesquisar" />
					</span>
				</fieldset>
			</div>
			<div class="content-area">
				<div class="infobar">
					<div id="toasterPlace"></div>
					<div class="event-action" id="new-location-template" style="display: none">
						<span class="add-event">
							<span class="address"></span>
							<a href="#replaceMe" class="bt btn-create">
								<g:message code="default.button.create.label" default="Create" />
							</a>
						</span>
						<span class="more-info"><a href="#" class="bt">Mais Informações</a></span>
					</div>
					<ul id="games-list" style="display:none">
						<h2>Lista de Jogos</h2>
						<li><a href="#" id="all_games">Todos os Jogos</a></li>
						<g:each in="${games}" status="i" var="game">
							<li>
								<a href="#" id="game_${game.id}"><g:game value="${game}"/></a>
							</li>
						</g:each>
					</ul>
											
				</div>
				<div class="map">
					<div id="map_canvas" style="width: 100%; height: 100%;">&nbsp;</div>
				</div>
				<div class="actions">
					<span class="my-local">
						<input class="bt" type="button" id="center" value="Centralizar"/>
					</span>
					<span class="show-event">
						<a id="bt_show_game_list" class="bt">Lista de Eventos</a>
					</span>
				</div>
			</div>
		</form>
	</body>
</html>
