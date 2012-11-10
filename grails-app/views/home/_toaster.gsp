<div class="toast">
	<span class="toastTitle">${location?.name}</span>
	<div class="countdown">
		<g:render template='countdown' /> 
	</div>
	<div class="toastMatch">
		<div id="team1">${event?.game?.teamAName()}</div>
		<span> x </span>
		<div id="team2">${event?.game?.teamBName()}</div>
	</div>
	<div class="toastDateGroup">
		<span id="toastDate">Data : ${event?.game?.formattedDate()}</span>
		<span id="toastTime">Horário : ${event?.game?.formattedTime()}</span>
	</div>
</div>