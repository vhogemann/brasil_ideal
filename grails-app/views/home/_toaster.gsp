<div class="toast">
    <span class="toastTitle">
    	<g:link controller="location" action="show" id="${location.id}">
    		${location?.name}
    	</g:link>
   	</span>
    <g:if test="${event}">
        <div class="countdown">
            <span time="${Math.round( event.game?.date.getTime() / 1000)}" class="kkcount-down"></span>
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
    </g:if>
</div>