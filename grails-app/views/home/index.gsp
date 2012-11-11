<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require module="index" />
		<r:require module="countdown" />
		<r:require module="kkcountdown" />
		<script type="text/javascript">
			var msgs = {
				start: 'O evento começa em ',
				started: 'O evento começou a '
			};
		</script>
		<script src="js/moment.min.js"></script>
		<script src="js/lang/pt-br.js"></script>
		<script type="text/javascript">
			moment.lang('pt-br');
			function reloadCountDown(){
				var min = 60;
				var hor = 60 * min;
				var dia = hor * 24;
				setInterval(function(){
					$(".kkcount-down").each(function(){
						var diffTime = parseInt($(this).attr("time"));
						var targetDate = new Date((new Date().getTime() + diffTime));
						var b = moment();
						var a = moment(targetDate);
						var seconds = a.diff(b, 'seconds');
						if(seconds > 0){
							$(this).text(msgs.start + a.fromNow());
						}else{
							$(this).text(msgs.started + a.fromNow());
						}
						
					});
				}, 1000);
			}

			function reloadCountDown2(){
				var min = 60;
				var hor = 60 * min;
				var dia = hor * 24;
				setInterval(function(){
					$(".kkcount-down").each(function(){
						var diffTime = parseInt($(this).attr("time"));
						var targetDate = new Date((new Date().getTime() + diffTime));
						var b = moment();
						var a = moment(targetDate);
						var seconds = a.diff(b, 'seconds');
						var dd = Math.floor(seconds / dia);
						seconds = seconds % dia;
						var hh = Math.floor(seconds / dia);
						seconds = seconds % hor;
						var mm = Math.floor(seconds / dia);
						seconds = seconds % min;
						
						var ss = seconds;
						$(this).text('Faltam ' + dd + ' dias ' + hh + ' horas ' + mm + ' min ' + ss + ' s.');
						
					});
				}, 1000);
			}
		</script>
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
						<input class="bt" type="button" value="<g:message code="search.button" default="Search!"/>" />
					</span>
				</fieldset>
			</div>
			<div class="content-area">
				<div class="infobar">
					<div id="toaster">
						<span id="close">[x]</span>
						<div id="toasterPlace"></div>
					</div>
					<div class="event-action" id="new-location-template" style="display: none">
						<div class="local-data">
							<h2 class="tit address"></h2>
							<a href="#replaceMe" class="bt btn-create">
								<g:message code="create.location" default="Register Pub" />
							</a>
						</div>
					</div>						
				</div>
				<div class="map">
					<div id="map_canvas" style="width: 100%; height: 100%;">&nbsp;</div>
				</div>
				<div class="actions">
					<span class="my-local">
						<input class="bt" type="button" id="center" value="<g:message code="center.map" default="Get Location"/>"/>
					</span>
					<span class="show-event">
						<a id="bt_show_game_list" class="bt"><g:message code="next.events" default="Next Games"/></a>
					</span>
					<div id="games-list" style="display:none;background-color:#fff;height:60px;overflow:auto;position:absolute;right:10px;width:250px;margin-top:20px">
						<span id="close-game-list" style="font-weight:bold;position:absolute;top:10px;right:10px;font-size:1.0em;cursor:pointer">[x]</span>
						<ul style="padding:15px;">
							<li><a href="#" id="all_games"><g:message code="all.events" default="All Matches"/></a></li>
							<g:each in="${games}" status="i" var="game">
								<li>
									<a href="#" id="game_${game.id}"><g:game value="${game}"/></a>
								</li>
							</g:each>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
