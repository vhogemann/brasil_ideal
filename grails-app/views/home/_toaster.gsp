<div class="toast">
	<div class="local-data">
		<h2 class="tit">
			<g:link controller="location" action="show" id="${location.id}">
	    		${location?.name}
	    	</g:link>
		</h2>
		<div class="adr">
			<address>
				<span class="street">${location.address}</span>
				<g:if test="${location.phone}">
					<span class="phone">(21) 00000000</span>
				</g:if>
			</address>
		</div>
	</div>
	
    <g:if test="${event}">
    	<div class="event-data">
			<div class="ev-data">
				<ul class="list1">
					<li class="li1">
						<span class="flag us">
							<span class="name">${event?.game?.teamAName()}</span>
						</span>
					</li>
					<li class="li2">
						<span class="flag us">
							<span class="us name">${event?.game?.teamBName()}</span>
						</span>
					</li>
				</ul>
			</div>
		</div>
        <div class="countdown">
            <span time="${Math.round( event.game?.date.getTime() / 1000)}" class="kkcount-down"></span>
        </div>
        <div class="toastDateGroup">
            <span id="toastDate"><g:message code="date" default="Date" /> : ${event?.game?.formattedDate()}</span>
            <span id="toastTime"><g:message code="time" default="Time" /> : ${event?.game?.formattedTime()}</span>
        </div>
    </g:if>
</div>