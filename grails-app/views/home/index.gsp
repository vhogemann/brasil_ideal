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
		<div class="search-area">
			<fieldset>
				<label for="searchKey">
					<span class="lbl">Search</span>
					<input type="hidden" id="txtLatitude" name="txtLatitude" />
					<input type="hidden" id="txtLongitude" name="txtLongitude" />
					<input type="text" id="searchKey" class="searchKey" name="searchKey" />
				</label>
				<span class="search">
					<input class="bt" type="submit" value="pesquisar" />
				</span>
			</fieldset>
		</div>
		<div class="content-area">
			<div class="infobar">
				<div class="local-data">
					<h2 class="tit">Nome do Local</h2>
					<div class="adr">
						<address>
							<span class="street">Nome da Rua</span>, no. <span class="number">000</span>
							<span class="city">Rio de Janeiro</span>
							<span class="phone">(21) 00000000</span>
						</address>
					</div>
				</div>
				<div class="event-data">
					<div class="ev-data">
						<ul class="list1">
							<li class="li1">
								<span class="flag us">
									<span class="name">Brasil</span>
								</span>
							</li>
							<li class="li2">
								<span class="flag us">
									<span class="us name">EUA</span>
								</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="event-action" id="new-location-template" style="display: none">
					<span class="add-event">
							<div class="address"></div>
						</div>
						<a href="#replaceMe" class="bt">
							<g:message code="default.button.create.label" default="Create" />
						</a>
					</span>
					<span class="more-info"><a href="#" class="bt">Mais Informações</a></span>
				</div>						
			</div>
			<div class="map">
				<div id="map_canvas" style="width: 480px; height: 480px;">&nbsp;</div>
				<div id="toasterPlace"></div>
			</div>
			<div class="actions">
				<span class="my-local">
					<input class="bt" type="button" id="center" value="Centralizar"/>
				</span>
				<span class="event-list">
					<a href="#" class="bt">Lista de Eventos</a>
				</span>
			</div>
		</div>
	</body>
</html>
