<div class="toast">
	<div class="local-data">
		<h2 class="tit">
			${location?.name}
		</h2>
		<div class="adr">
			<address>
				<span class="street">${location.address}</span>
				<g:if test="${location.phone}">
					<span class="phone">${location.phone}</span>
				</g:if>
			</address>
		</div>
		<div class="toastDateGroup">
            <span id="toastDate"><g:message code="date" default="Date" /> : ${event?.game?.formattedDate()}</span>
            <span id="toastTime"><g:message code="time" default="Time" /> : ${event?.game?.formattedTime()}</span>
        </div>
	</div>
	
    <g:if test="${event}">
    	<div class="event-data">
			<div class="ev-data">
			
				<div class="event">
					<span class="vs1">
						<span class="flag">
							<span class="${event.game?.teamA()?.code?.toLowerCase()}">bandeira do pais</span>
							<strong class="name">${event.game?.teamA()?.name?.encodeAsHTML()}</strong>
						</span>
					</span>
					<span class="score">
						<span class="value">0</span>
						<span class="vs">x</span>
						<span class="value">0</span>
					</span>
					<span class="vs2">
						<span class="flag">
							<span class="${event.game?.teamB()?.code?.toLowerCase()}">bandeira do pais</span>
							<strong class="name">${event.game?.teamB()?.name?.encodeAsHTML()}</strong>
						</span>
					</span>
				</div>
				<div class="countdown">
            		<span time="${Math.round( event.game?.date.getTime() / 1000)}" class="kkcount-down"></span>
        		</div>
				<div class="ev-list">
					<ul class="event-list">
						<g:each in="${events }" var="event">
							<li>
								<span class="vs1">
									<span class="flag">
										<span class="${event.game?.teamA()?.code?.toLowerCase()}">bandeira do pais</span>
										<strong class="name">${event.game.teamA()?.name?.encodeAsHTML()}</strong>
									</span>
								</span>
								<span class="score">
									<span class="value">0</span>
									<span class="vs">x</span>
									<span class="value">0</span>
								</span>
								<span class="vs2">
									<span class="flag">
										<span class="${event?.game?.teamB()?.code?.toLowerCase()}">bandeira do pais</span>
										<strong class="name">${event?.game?.teamB()?.name?.encodeAsHTML()}</strong>
									</span>
								</span>
							</li>
						</g:each>
					</ul>
				</div>
			</div>
		</div>
	</g:if>
	<div class="event-action">
		<span class="add-event"><g:link controller="location" action="associate" id="${location.id}" class="bt">Adicionar Jogo</g:link></span>
		<span class="more-info"><g:link controller="location" action="show" id="${location.id}" class="bt">Mais Informações</g:link></span>
	</div>
</div>